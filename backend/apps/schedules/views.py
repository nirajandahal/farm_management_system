from rest_framework import mixins, permissions, status, viewsets
from rest_framework.decorators import action
from rest_framework.response import Response

from apps.audit.models import AuditLogEntry
from apps.core.mixins import FarmScopedQuerysetMixin
from apps.core.permissions import IsFarmAdmin, IsFarmMember, require_plan_tier
from apps.farms.models import Farm

from .models import Occurrence, Schedule
from .serializers import (
    OccurrenceCompleteSerializer,
    OccurrenceSerializer,
    OccurrenceSkipSerializer,
    ScheduleSerializer,
    SyncBatchItemSerializer,
)

_TIER_1_PLUS = require_plan_tier(Farm.PlanTier.TIER_1, Farm.PlanTier.TIER_2, Farm.PlanTier.TIER_3)


class ScheduleViewSet(FarmScopedQuerysetMixin, viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated, IsFarmMember]
    serializer_class = ScheduleSerializer
    queryset = Schedule.objects.all()
    filterset_fields = ["schedule_type", "urgency", "is_active", "assigned_to"]

    def get_permissions(self):
        # Single source of truth for permissions on every action -- see the
        # matching note in SupplyViewSet.get_permissions.
        if self.action == "suggestions":
            return [permissions.IsAuthenticated(), IsFarmAdmin(), _TIER_1_PLUS()]
        if self.action in ("create", "update", "partial_update", "destroy"):
            return [permissions.IsAuthenticated(), IsFarmAdmin()]
        return [permissions.IsAuthenticated(), IsFarmMember()]

    def perform_create(self, serializer):
        schedule = serializer.save(farm=self.request.user.farm, created_by=self.request.user)
        AuditLogEntry.record(
            farm=self.request.user.farm, actor=self.request.user,
            action=AuditLogEntry.Action.CREATE, category=AuditLogEntry.Category.SCHEDULE,
            target=schedule, description=f"Created schedule {schedule.title}",
        )

    def perform_update(self, serializer):
        # NOTE: this edits the schedule going forward only -- it does not
        # retroactively touch already-generated Occurrence rows. A full
        # "this occurrence / this-and-future / all" edit scope (as with a
        # calendar app) is a larger feature, deliberately not built here.
        schedule = serializer.save()
        AuditLogEntry.record(
            farm=self.request.user.farm, actor=self.request.user,
            action=AuditLogEntry.Action.UPDATE, category=AuditLogEntry.Category.SCHEDULE,
            target=schedule, description=f"Updated schedule {schedule.title}",
        )

    def perform_destroy(self, instance):
        instance.is_active = False
        instance.save()
        AuditLogEntry.record(
            farm=self.request.user.farm, actor=self.request.user,
            action=AuditLogEntry.Action.ARCHIVE, category=AuditLogEntry.Category.SCHEDULE,
            target=instance, description=f"Deactivated schedule {instance.title}",
        )

    @action(detail=False, methods=["get"])
    def suggestions(self, request):
        # The actual suggestion heuristic/model doesn't exist yet -- this
        # endpoint is wired up (auth + tier gate) but has no real logic
        # behind it. Honest placeholder rather than fabricated output.
        return Response(
            {"detail": "Smart schedule suggestions are not implemented yet."},
            status=status.HTTP_501_NOT_IMPLEMENTED,
        )


class OccurrenceViewSet(
    FarmScopedQuerysetMixin,
    mixins.ListModelMixin,
    mixins.RetrieveModelMixin,
    viewsets.GenericViewSet,
):
    permission_classes = [permissions.IsAuthenticated, IsFarmMember]
    serializer_class = OccurrenceSerializer
    queryset = Occurrence.objects.select_related("schedule")
    filterset_fields = ["status", "due_date"]
    farm_field = "schedule__farm"

    @action(detail=True, methods=["patch"])
    def complete(self, request, pk=None):
        occurrence = self.get_object()
        serializer = OccurrenceCompleteSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        occurrence.mark_complete(completed_by=request.user, **serializer.validated_data)
        AuditLogEntry.record(
            farm=request.user.farm, actor=request.user,
            action=AuditLogEntry.Action.COMPLETE, category=AuditLogEntry.Category.SCHEDULE,
            target=occurrence, description=f"Completed {occurrence.title} ({occurrence.due_date})",
        )
        return Response(OccurrenceSerializer(occurrence).data)

    @action(detail=True, methods=["patch"])
    def skip(self, request, pk=None):
        occurrence = self.get_object()
        serializer = OccurrenceSkipSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        occurrence.mark_skipped(**serializer.validated_data)
        AuditLogEntry.record(
            farm=request.user.farm, actor=request.user,
            action=AuditLogEntry.Action.SKIP, category=AuditLogEntry.Category.SCHEDULE,
            target=occurrence, description=f"Skipped {occurrence.title} ({occurrence.due_date})",
        )
        return Response(OccurrenceSerializer(occurrence).data)

    @action(detail=False, methods=["post"], url_path="sync-batch")
    def sync_batch(self, request):
        results = []
        for raw_item in request.data.get("completions", []):
            item_serializer = SyncBatchItemSerializer(data=raw_item)
            if not item_serializer.is_valid():
                results.append({"occurrence_id": raw_item.get("occurrence_id"), "status": "invalid", "errors": item_serializer.errors})
                continue

            data = dict(item_serializer.validated_data)
            occurrence_id = data.pop("occurrence_id")
            data.pop("completed_at", None)  # server timestamp wins, not client clock
            try:
                occurrence = Occurrence.objects.get(id=occurrence_id, schedule__farm=request.user.farm)
            except Occurrence.DoesNotExist:
                results.append({"occurrence_id": str(occurrence_id), "status": "not_found"})
                continue

            if occurrence.status == Occurrence.Status.COMPLETED:
                results.append({"occurrence_id": str(occurrence_id), "status": "already_completed"})
                continue

            occurrence.mark_complete(completed_by=request.user, **data)
            results.append({"occurrence_id": str(occurrence_id), "status": "ok"})

        return Response({"results": results})

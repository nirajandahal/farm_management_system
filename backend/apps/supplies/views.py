from decimal import Decimal, InvalidOperation

from django.utils import timezone
from rest_framework import permissions, status, viewsets
from rest_framework.decorators import action
from rest_framework.exceptions import ValidationError
from rest_framework.response import Response

from apps.audit.models import AuditLogEntry
from apps.core.mixins import FarmScopedQuerysetMixin
from apps.core.permissions import IsFarmAdmin, IsFarmMember, require_plan_tier
from apps.farms.models import Farm

from .models import ConsumptionLogEntry, Supply
from .serializers import ConsumptionLogEntrySerializer, SupplyForecastSerializer, SupplySerializer

_TIER_1_PLUS = require_plan_tier(Farm.PlanTier.TIER_1, Farm.PlanTier.TIER_2, Farm.PlanTier.TIER_3)


class SupplyViewSet(FarmScopedQuerysetMixin, viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated, IsFarmMember]
    serializer_class = SupplySerializer
    queryset = Supply.objects.all()
    filterset_fields = ["category", "storage_zone", "is_archived"]

    def get_permissions(self):
        # NOTE: this override is the single source of truth for permissions
        # on every action -- any action needing something other than the
        # two defaults below (e.g. "forecast"'s tier gate) must be listed
        # here explicitly, since @action(permission_classes=[...]) on its
        # own would otherwise be silently ignored by this override.
        if self.action == "forecast":
            return [permissions.IsAuthenticated(), IsFarmMember(), _TIER_1_PLUS()]
        if self.action in ("create", "update", "partial_update", "destroy"):
            return [permissions.IsAuthenticated(), IsFarmAdmin()]
        return [permissions.IsAuthenticated(), IsFarmMember()]

    def perform_create(self, serializer):
        supply = serializer.save(farm=self.request.user.farm)
        AuditLogEntry.record(
            farm=self.request.user.farm, actor=self.request.user,
            action=AuditLogEntry.Action.CREATE, category=AuditLogEntry.Category.SUPPLY,
            target=supply, description=f"Added supply {supply.name}",
        )

    def perform_destroy(self, instance):
        instance.is_archived = True
        instance.archived_at = timezone.now()
        instance.save()
        AuditLogEntry.record(
            farm=self.request.user.farm, actor=self.request.user,
            action=AuditLogEntry.Action.ARCHIVE, category=AuditLogEntry.Category.SUPPLY,
            target=instance, description=f"Archived supply {instance.name}",
        )

    @action(detail=True, methods=["post"], url_path="stock-adjustment")
    def stock_adjustment(self, request, pk=None):
        supply = self.get_object()
        adjustment_type = request.data.get("adjustment_type")
        valid_types = (ConsumptionLogEntry.AdjustmentType.RESTOCK, ConsumptionLogEntry.AdjustmentType.MANUAL_UPDATE)
        if adjustment_type not in valid_types:
            raise ValidationError({"adjustment_type": f"Must be one of {[t.value for t in valid_types]}."})

        try:
            if adjustment_type == ConsumptionLogEntry.AdjustmentType.RESTOCK:
                quantity = Decimal(str(request.data.get("quantity", "0")))
                new_stock = supply.current_stock + quantity
                logged_amount = quantity
            else:
                new_stock = Decimal(str(request.data["new_stock"]))
                logged_amount = abs(supply.current_stock - new_stock)
        except (KeyError, InvalidOperation):
            raise ValidationError({"detail": "quantity (RESTOCK) or new_stock (MANUAL_UPDATE) is required and must be numeric."})

        supply.current_stock = new_stock
        supply.save()

        log = ConsumptionLogEntry.objects.create(
            supply=supply, actual_quantity=logged_amount,
            adjustment_type=adjustment_type, logged_by=request.user,
        )
        AuditLogEntry.record(
            farm=self.request.user.farm, actor=request.user,
            action=AuditLogEntry.Action.UPDATE, category=AuditLogEntry.Category.SUPPLY,
            target=supply, description=f"{adjustment_type}: stock now {new_stock}",
        )
        return Response(SupplySerializer(supply).data)

    @action(detail=True, methods=["get"], url_path="consumption-history")
    def consumption_history(self, request, pk=None):
        supply = self.get_object()
        page = self.paginate_queryset(supply.consumption_logs.all())
        serializer = ConsumptionLogEntrySerializer(page, many=True)
        return self.get_paginated_response(serializer.data)

    @action(detail=True, methods=["get"])
    def forecast(self, request, pk=None):
        supply = self.get_object()
        forecast = getattr(supply, "forecast", None)
        if forecast is None:
            return Response(
                {"detail": "Forecast not yet computed for this supply."},
                status=status.HTTP_404_NOT_FOUND,
            )
        return Response(SupplyForecastSerializer(forecast).data)

from django.utils import timezone
from rest_framework import generics, permissions, viewsets
from rest_framework.response import Response

from apps.audit.models import AuditLogEntry
from apps.core.mixins import FarmScopedQuerysetMixin
from apps.core.permissions import IsFarmAdmin, IsFarmMember

from .models import Farm, Zone
from .serializers import FarmModulesSerializer, FarmSerializer, ZoneSerializer


class FarmDetailView(generics.RetrieveUpdateAPIView):
    serializer_class = FarmSerializer

    def get_permissions(self):
        if self.request.method in permissions.SAFE_METHODS:
            return [permissions.IsAuthenticated(), IsFarmMember()]
        return [permissions.IsAuthenticated(), IsFarmAdmin()]

    def get_object(self):
        return self.request.user.farm


class FarmModulesView(generics.UpdateAPIView):
    permission_classes = [permissions.IsAuthenticated, IsFarmAdmin]
    serializer_class = FarmModulesSerializer

    def get_object(self):
        return self.request.user.farm

    def update(self, request, *args, **kwargs):
        farm = self.get_object()
        before = {
            field: getattr(farm, field)
            for field in ["has_animals", "has_plants", "has_fungi", "has_fish"]
        }
        response = super().update(request, *args, **kwargs)
        farm.refresh_from_db()
        for field, was_enabled in before.items():
            is_enabled = getattr(farm, field)
            if was_enabled != is_enabled:
                AuditLogEntry.record(
                    farm=farm,
                    actor=request.user,
                    action=AuditLogEntry.Action.MODULE_ENABLED if is_enabled else AuditLogEntry.Action.MODULE_DISABLED,
                    category=AuditLogEntry.Category.MANAGEMENT,
                    target=farm,
                    description=f"{field} {'enabled' if is_enabled else 'disabled'}",
                )
        return response


class ZoneViewSet(FarmScopedQuerysetMixin, viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated, IsFarmMember]
    serializer_class = ZoneSerializer
    queryset = Zone.objects.all()
    filterset_fields = ["zone_type", "is_archived"]

    def get_permissions(self):
        if self.action in ("create", "update", "partial_update", "destroy"):
            return [permissions.IsAuthenticated(), IsFarmAdmin()]
        return [permissions.IsAuthenticated(), IsFarmMember()]

    def perform_create(self, serializer):
        zone = serializer.save(farm=self.request.user.farm)
        AuditLogEntry.record(
            farm=self.request.user.farm, actor=self.request.user,
            action=AuditLogEntry.Action.CREATE, category=AuditLogEntry.Category.MANAGEMENT,
            target=zone, description=f"Created zone {zone.name}",
        )

    def perform_destroy(self, instance):
        instance.is_archived = True
        instance.archived_at = timezone.now()
        instance.save()
        AuditLogEntry.record(
            farm=self.request.user.farm, actor=self.request.user,
            action=AuditLogEntry.Action.ARCHIVE, category=AuditLogEntry.Category.MANAGEMENT,
            target=instance, description=f"Archived zone {instance.name}",
        )

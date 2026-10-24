from django.utils import timezone
from rest_framework import generics, permissions, viewsets

from apps.audit.models import AuditLogEntry
from apps.core.mixins import FarmScopedQuerysetMixin
from apps.core.permissions import IsFarmAdmin, IsFarmMember

from .models import BreedingLogEntry, HealthLogEntry, LivingInventoryItem, ProductionLogEntry
from .serializers import (
    BreedingLogEntrySerializer,
    HealthLogEntrySerializer,
    LivingInventoryItemSerializer,
    ProductionLogEntrySerializer,
)


class LivingInventoryItemViewSet(FarmScopedQuerysetMixin, viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated, IsFarmMember]
    serializer_class = LivingInventoryItemSerializer
    queryset = LivingInventoryItem.objects.all()
    filterset_fields = ["domain_type", "zone", "health_status", "is_archived"]

    def perform_create(self, serializer):
        item = serializer.save()
        AuditLogEntry.record(
            farm=self.request.user.farm, actor=self.request.user,
            action=AuditLogEntry.Action.CREATE, category=AuditLogEntry.Category.MANAGEMENT,
            target=item, description=f"Added {item.name} to living inventory",
        )

    def perform_update(self, serializer):
        item = serializer.save()
        AuditLogEntry.record(
            farm=self.request.user.farm, actor=self.request.user,
            action=AuditLogEntry.Action.UPDATE, category=AuditLogEntry.Category.MANAGEMENT,
            target=item, description=f"Updated {item.name}",
        )

    def perform_destroy(self, instance):
        instance.is_archived = True
        instance.archived_at = timezone.now()
        instance.save()
        AuditLogEntry.record(
            farm=self.request.user.farm, actor=self.request.user,
            action=AuditLogEntry.Action.ARCHIVE, category=AuditLogEntry.Category.MANAGEMENT,
            target=instance, description=f"Archived {instance.name}",
        )


class _NestedLogListCreateView(generics.ListCreateAPIView):
    """Shared base for the three per-item log endpoints -- all three are
    "list/create scoped to one inventory item, farm-checked, logged_by
    stamped from the request", so this factors out that repetition.
    """

    permission_classes = [permissions.IsAuthenticated, IsFarmMember]
    log_model = None

    def get_item(self):
        return LivingInventoryItem.objects.get(
            pk=self.kwargs["item_id"], farm=self.request.user.farm
        )

    def get_queryset(self):
        if getattr(self, "swagger_fake_view", False):
            return self.log_model.objects.none()
        return self.log_model.objects.filter(item=self.get_item())

    def perform_create(self, serializer):
        serializer.save(item=self.get_item(), logged_by=self.request.user)


class HealthLogListCreateView(_NestedLogListCreateView):
    serializer_class = HealthLogEntrySerializer
    log_model = HealthLogEntry


class ProductionLogListCreateView(_NestedLogListCreateView):
    serializer_class = ProductionLogEntrySerializer
    log_model = ProductionLogEntry


class BreedingLogListCreateView(_NestedLogListCreateView):
    serializer_class = BreedingLogEntrySerializer
    log_model = BreedingLogEntry

    def perform_create(self, serializer):
        item = self.get_item()
        if item.domain_type != LivingInventoryItem.DomainType.ANIMAL:
            from rest_framework.exceptions import ValidationError

            raise ValidationError("Breeding logs only apply to ANIMAL items.")
        serializer.save(item=item, logged_by=self.request.user)

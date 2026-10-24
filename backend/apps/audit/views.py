from rest_framework import generics, permissions

from apps.core.mixins import FarmScopedQuerysetMixin
from apps.core.permissions import IsFarmAdmin

from .models import AuditLogEntry
from .serializers import AuditLogEntrySerializer


class AuditLogListView(FarmScopedQuerysetMixin, generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticated, IsFarmAdmin]
    serializer_class = AuditLogEntrySerializer
    queryset = AuditLogEntry.objects.all()
    filterset_fields = ["category", "action", "is_cold_archived"]

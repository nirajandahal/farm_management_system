from rest_framework import serializers

from .models import AuditLogEntry


class AuditLogEntrySerializer(serializers.ModelSerializer):
    class Meta:
        model = AuditLogEntry
        fields = [
            "id", "actor", "action", "category", "target_model", "target_id",
            "target_display_name", "reference_id", "description",
            "is_cold_archived", "created_at",
        ]
        read_only_fields = fields

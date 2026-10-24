from rest_framework import serializers

from .models import Occurrence, Schedule


class ScheduleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Schedule
        fields = [
            "id", "farm", "title", "schedule_type",
            "recurrence_frequency", "recurrence_interval", "recurrence_days_of_week",
            "start_date", "end_date",
            "linked_zone", "linked_inventory_item", "linked_supply", "expected_quantity",
            "alarm_enabled", "alarm_time", "urgency", "assigned_to", "created_by",
            "is_active",
        ]
        read_only_fields = ["id", "farm", "created_by", "is_active"]


class OccurrenceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Occurrence
        fields = [
            "id", "schedule", "title", "urgency", "due_date", "due_time", "status",
            "completed_at", "completed_by", "actual_quantity",
            "skip_reason", "note", "geotag_lat", "geotag_lng",
        ]
        read_only_fields = [
            "id", "schedule", "title", "urgency", "status", "completed_at", "completed_by",
        ]


class OccurrenceCompleteSerializer(serializers.Serializer):
    actual_quantity = serializers.DecimalField(max_digits=10, decimal_places=2, required=False)
    geotag_lat = serializers.DecimalField(max_digits=9, decimal_places=6, required=False)
    geotag_lng = serializers.DecimalField(max_digits=9, decimal_places=6, required=False)
    note = serializers.CharField(required=False, allow_blank=True)


class OccurrenceSkipSerializer(serializers.Serializer):
    reason = serializers.CharField(required=False, allow_blank=True)


class SyncBatchItemSerializer(serializers.Serializer):
    occurrence_id = serializers.UUIDField()
    actual_quantity = serializers.DecimalField(max_digits=10, decimal_places=2, required=False)
    geotag_lat = serializers.DecimalField(max_digits=9, decimal_places=6, required=False)
    geotag_lng = serializers.DecimalField(max_digits=9, decimal_places=6, required=False)
    note = serializers.CharField(required=False, allow_blank=True)
    completed_at = serializers.DateTimeField(required=False)

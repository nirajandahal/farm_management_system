from rest_framework import serializers

from .models import ConsumptionLogEntry, Supply, SupplyForecast


class SupplySerializer(serializers.ModelSerializer):
    class Meta:
        model = Supply
        fields = [
            "id", "farm", "storage_zone", "name", "category", "photo",
            "current_stock", "total_capacity", "unit", "batch_number",
            "expiry_date", "reorder_threshold_days", "is_archived",
        ]
        read_only_fields = ["id", "farm", "current_stock", "is_archived"]


class ConsumptionLogEntrySerializer(serializers.ModelSerializer):
    class Meta:
        model = ConsumptionLogEntry
        fields = [
            "id", "supply", "occurrence", "expected_quantity", "actual_quantity",
            "adjustment_type", "geotag_lat", "geotag_lng", "logged_by", "created_at",
        ]
        read_only_fields = fields


class SupplyForecastSerializer(serializers.ModelSerializer):
    class Meta:
        model = SupplyForecast
        fields = ["supply", "daily_usage_rate", "predicted_empty_date", "last_computed_at"]
        read_only_fields = fields

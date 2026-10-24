from rest_framework import serializers

from .models import Farm, Zone


class FarmSerializer(serializers.ModelSerializer):
    class Meta:
        model = Farm
        fields = [
            "id", "name", "owner", "location", "timezone",
            "has_animals", "has_plants", "has_fungi", "has_fish",
            "plan_tier",
        ]
        read_only_fields = ["id", "owner", "plan_tier"]


class FarmModulesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Farm
        fields = ["has_animals", "has_plants", "has_fungi", "has_fish"]


class ZoneSerializer(serializers.ModelSerializer):
    class Meta:
        model = Zone
        fields = ["id", "farm", "name", "zone_type", "capacity", "is_archived"]
        read_only_fields = ["id", "farm", "is_archived"]

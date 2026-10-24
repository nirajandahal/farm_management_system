from rest_framework import serializers

from .models import (
    AnimalDetail,
    BreedingLogEntry,
    CropDetail,
    FishDetail,
    FungiDetail,
    HealthLogEntry,
    LivingInventoryItem,
    ProductionLogEntry,
)


class AnimalDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = AnimalDetail
        fields = [
            "breed", "avg_weight", "breeding_status",
            "last_mating_date", "expected_delivery_date",
        ]


class CropDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = CropDetail
        fields = ["planting_date", "growth_stage", "expected_harvest_date", "soil_type"]


class FishDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = FishDetail
        fields = ["target_water_temp", "target_ph", "feeding_note"]


class FungiDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = FungiDetail
        fields = ["substrate_type", "target_humidity", "target_temperature", "flush_cycle_days"]


_DETAIL_SERIALIZERS = {
    LivingInventoryItem.DomainType.ANIMAL: (AnimalDetailSerializer, "animal_detail"),
    LivingInventoryItem.DomainType.CROP: (CropDetailSerializer, "crop_detail"),
    LivingInventoryItem.DomainType.FISH: (FishDetailSerializer, "fish_detail"),
    LivingInventoryItem.DomainType.FUNGI: (FungiDetailSerializer, "fungi_detail"),
}


class LivingInventoryItemSerializer(serializers.ModelSerializer):
    detail = serializers.SerializerMethodField()
    detail_input = serializers.DictField(write_only=True, required=False)

    class Meta:
        model = LivingInventoryItem
        fields = [
            "id", "farm", "zone", "domain_type", "name", "species_or_variety",
            "quantity", "health_status", "reference_photo", "is_archived",
            "detail", "detail_input", "created_at", "updated_at",
        ]
        read_only_fields = ["id", "farm", "is_archived", "created_at", "updated_at"]

    def get_detail(self, obj):
        serializer_cls, related_name = _DETAIL_SERIALIZERS.get(obj.domain_type, (None, None))
        if serializer_cls is None:
            return None
        detail_obj = getattr(obj, related_name, None)
        return serializer_cls(detail_obj).data if detail_obj else None

    def _save_detail(self, item, detail_data):
        serializer_cls, related_name = _DETAIL_SERIALIZERS.get(item.domain_type, (None, None))
        if serializer_cls is None or not detail_data:
            return
        existing = getattr(item, related_name, None)
        detail_serializer = serializer_cls(instance=existing, data=detail_data, partial=existing is not None)
        detail_serializer.is_valid(raise_exception=True)
        detail_serializer.save(item=item)

    def create(self, validated_data):
        detail_data = validated_data.pop("detail_input", None)
        item = LivingInventoryItem.objects.create(
            farm=self.context["request"].user.farm, **validated_data
        )
        self._save_detail(item, detail_data)
        return item

    def update(self, instance, validated_data):
        detail_data = validated_data.pop("detail_input", None)
        instance = super().update(instance, validated_data)
        self._save_detail(instance, detail_data)
        return instance


class HealthLogEntrySerializer(serializers.ModelSerializer):
    class Meta:
        model = HealthLogEntry
        fields = [
            "id", "item", "severity", "issue_description", "treatment_required",
            "doctor_name", "note", "logged_by", "created_at",
        ]
        read_only_fields = ["id", "item", "logged_by", "created_at"]


class ProductionLogEntrySerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductionLogEntry
        fields = [
            "id", "item", "individual_id_tag", "metric_type", "value", "unit",
            "logged_by", "created_at",
        ]
        read_only_fields = ["id", "item", "logged_by", "created_at"]


class BreedingLogEntrySerializer(serializers.ModelSerializer):
    class Meta:
        model = BreedingLogEntry
        fields = [
            "id", "item", "individual_id_tag", "last_mating_date",
            "breeding_status", "expected_delivery_date", "logged_by", "created_at",
        ]
        read_only_fields = ["id", "item", "logged_by", "created_at"]

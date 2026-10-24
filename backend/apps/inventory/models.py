from django.conf import settings
from django.core.exceptions import ValidationError
from django.db import models

from apps.core.models import ArchivableModel, TimestampedModel, UUIDModel
from apps.farms.models import Farm, Zone


class LivingInventoryItem(UUIDModel, TimestampedModel, ArchivableModel):
    class DomainType(models.TextChoices):
        ANIMAL = "ANIMAL", "Animal"
        CROP = "CROP", "Crop"
        FISH = "FISH", "Fish"
        FUNGI = "FUNGI", "Fungi"

    class HealthStatus(models.TextChoices):
        HEALTHY = "HEALTHY", "Healthy"
        MONITORING = "MONITORING", "Monitoring"
        CRITICAL = "CRITICAL", "Critical"

    farm = models.ForeignKey(
        Farm, on_delete=models.CASCADE, related_name="inventory_items"
    )
    zone = models.ForeignKey(
        Zone,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="inventory_items",
    )

    domain_type = models.CharField(max_length=16, choices=DomainType.choices)
    name = models.CharField(max_length=255)
    species_or_variety = models.CharField(max_length=255, blank=True)
    quantity = models.PositiveIntegerField(default=0)
    health_status = models.CharField(
        max_length=16, choices=HealthStatus.choices, default=HealthStatus.HEALTHY
    )
    reference_photo = models.ImageField(
        upload_to="inventory_photos/", null=True, blank=True
    )

    def __str__(self):
        return f"{self.name} ({self.get_domain_type_display()})"


class AnimalDetail(UUIDModel, TimestampedModel):
    class BreedingStatus(models.TextChoices):
        OPEN = "OPEN", "Open"
        PREGNANT = "PREGNANT", "Pregnant"
        POST_PARTUM = "POST_PARTUM", "Post-Partum"

    item = models.OneToOneField(
        LivingInventoryItem, on_delete=models.CASCADE, related_name="animal_detail"
    )
    breed = models.CharField(max_length=255, blank=True)
    avg_weight = models.DecimalField(
        max_digits=8, decimal_places=2, null=True, blank=True
    )
    breeding_status = models.CharField(
        max_length=16, choices=BreedingStatus.choices, null=True, blank=True
    )
    last_mating_date = models.DateField(null=True, blank=True)
    expected_delivery_date = models.DateField(null=True, blank=True)

    def clean(self):
        if self.item.domain_type != LivingInventoryItem.DomainType.ANIMAL:
            raise ValidationError("AnimalDetail can only attach to an ANIMAL item.")


class CropDetail(UUIDModel, TimestampedModel):
    item = models.OneToOneField(
        LivingInventoryItem, on_delete=models.CASCADE, related_name="crop_detail"
    )
    planting_date = models.DateField(null=True, blank=True)
    growth_stage = models.CharField(max_length=100, blank=True)
    expected_harvest_date = models.DateField(null=True, blank=True)
    soil_type = models.CharField(max_length=100, blank=True)

    def clean(self):
        if self.item.domain_type != LivingInventoryItem.DomainType.CROP:
            raise ValidationError("CropDetail can only attach to a CROP item.")


class FishDetail(UUIDModel, TimestampedModel):
    item = models.OneToOneField(
        LivingInventoryItem, on_delete=models.CASCADE, related_name="fish_detail"
    )
    target_water_temp = models.DecimalField(
        max_digits=5, decimal_places=2, null=True, blank=True
    )
    target_ph = models.DecimalField(
        max_digits=4, decimal_places=2, null=True, blank=True
    )
    feeding_note = models.TextField(blank=True)

    def clean(self):
        if self.item.domain_type != LivingInventoryItem.DomainType.FISH:
            raise ValidationError("FishDetail can only attach to a FISH item.")


class FungiDetail(UUIDModel, TimestampedModel):
    item = models.OneToOneField(
        LivingInventoryItem, on_delete=models.CASCADE, related_name="fungi_detail"
    )
    substrate_type = models.CharField(max_length=255, blank=True)
    target_humidity = models.DecimalField(
        max_digits=5, decimal_places=2, null=True, blank=True
    )
    target_temperature = models.DecimalField(
        max_digits=5, decimal_places=2, null=True, blank=True
    )
    flush_cycle_days = models.PositiveIntegerField(null=True, blank=True)

    def clean(self):
        if self.item.domain_type != LivingInventoryItem.DomainType.FUNGI:
            raise ValidationError("FungiDetail can only attach to a FUNGI item.")


class HealthLogEntry(UUIDModel, TimestampedModel):
    class Severity(models.TextChoices):
        CRITICAL = "CRITICAL", "Critical"
        MODERATE = "MODERATE", "Moderate"
        ROUTINE = "ROUTINE", "Routine"

    item = models.ForeignKey(
        LivingInventoryItem, on_delete=models.CASCADE, related_name="health_logs"
    )
    severity = models.CharField(max_length=16, choices=Severity.choices)
    issue_description = models.TextField(blank=True)
    treatment_required = models.TextField(blank=True)
    doctor_name = models.CharField(max_length=255, blank=True)
    note = models.TextField(blank=True)
    logged_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        related_name="health_logs_recorded",
    )

    class Meta:
        ordering = ["-created_at"]


class ProductionLogEntry(UUIDModel, TimestampedModel):
    class MetricType(models.TextChoices):
        MILK_YIELD = "MILK_YIELD", "Milk Yield"
        EGG_COUNT = "EGG_COUNT", "Egg Count"
        HARVEST_QTY = "HARVEST_QTY", "Harvest Quantity"
        GROWTH_WEIGHT = "GROWTH_WEIGHT", "Growth Weight"
        OTHER = "OTHER", "Other"

    item = models.ForeignKey(
        LivingInventoryItem, on_delete=models.CASCADE, related_name="production_logs"
    )
    individual_id_tag = models.CharField(max_length=100, blank=True)
    metric_type = models.CharField(max_length=20, choices=MetricType.choices)
    value = models.DecimalField(max_digits=10, decimal_places=2)
    unit = models.CharField(max_length=20)
    logged_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        related_name="production_logs_recorded",
    )

    class Meta:
        ordering = ["-created_at"]


class BreedingLogEntry(UUIDModel, TimestampedModel):
    class BreedingStatus(models.TextChoices):
        OPEN = "OPEN", "Open"
        PREGNANT = "PREGNANT", "Pregnant"
        POST_PARTUM = "POST_PARTUM", "Post-Partum"

    item = models.ForeignKey(
        LivingInventoryItem, on_delete=models.CASCADE, related_name="breeding_logs"
    )
    individual_id_tag = models.CharField(max_length=100, blank=True)
    last_mating_date = models.DateField(null=True, blank=True)
    breeding_status = models.CharField(max_length=16, choices=BreedingStatus.choices)
    expected_delivery_date = models.DateField(null=True, blank=True)
    logged_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        related_name="breeding_logs_recorded",
    )

    def clean(self):
        if self.item.domain_type != LivingInventoryItem.DomainType.ANIMAL:
            raise ValidationError("Breeding logs only apply to ANIMAL items.")

    class Meta:
        ordering = ["-created_at"]

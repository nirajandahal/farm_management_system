from django.conf import settings
from django.db import models

from apps.core.models import ArchivableModel, TimestampedModel, UUIDModel
from apps.farms.models import Farm, Zone
from apps.inventory.models import LivingInventoryItem


class Supply(UUIDModel, TimestampedModel, ArchivableModel):
    class Category(models.TextChoices):
        ANIMAL_FEED = "ANIMAL_FEED", "Animal Feed"
        FERTILIZER = "FERTILIZER", "Fertilizer"
        MEDICINE = "MEDICINE", "Medicine"
        SEED = "SEED", "Seed"
        OTHER = "OTHER", "Other"

    class Unit(models.TextChoices):
        KG = "KG", "Kilograms"
        LITERS = "LITERS", "Liters"
        PACKETS = "PACKETS", "Packets"
        UNITS = "UNITS", "Units"
        OTHER = "OTHER", "Other"

    farm = models.ForeignKey(Farm, on_delete=models.CASCADE, related_name="supplies")
    storage_zone = models.ForeignKey(
        Zone, on_delete=models.SET_NULL, null=True, blank=True, related_name="supplies"
    )

    name = models.CharField(max_length=255)
    category = models.CharField(max_length=16, choices=Category.choices)
    photo = models.ImageField(upload_to="supply_photos/", null=True, blank=True)

    current_stock = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    total_capacity = models.DecimalField(
        max_digits=10, decimal_places=2, null=True, blank=True
    )
    unit = models.CharField(max_length=16, choices=Unit.choices)

    batch_number = models.CharField(max_length=100, blank=True)
    expiry_date = models.DateField(null=True, blank=True)
    reorder_threshold_days = models.PositiveIntegerField(null=True, blank=True)

    def __str__(self):
        return f"{self.name} ({self.farm.name})"


class SupplyConsumptionGroup(UUIDModel, TimestampedModel):
    """Links a supply to the living-inventory groups that consume it, e.g.
    'Holstein Cows - 12kg/head daily' from a supply's detail screen.
    """

    supply = models.ForeignKey(
        Supply, on_delete=models.CASCADE, related_name="consumption_groups"
    )
    inventory_item = models.ForeignKey(
        LivingInventoryItem, on_delete=models.CASCADE, related_name="consumption_groups"
    )
    daily_amount_per_unit = models.DecimalField(max_digits=8, decimal_places=2)

    class Meta:
        unique_together = ("supply", "inventory_item")

    def __str__(self):
        return f"{self.supply.name} -> {self.inventory_item.name}"


class ConsumptionLogEntry(UUIDModel, TimestampedModel):
    """Every stock deduction, whichever source caused it. This is the data
    the forecasting engine (SupplyForecast) is computed from.
    """

    class AdjustmentType(models.TextChoices):
        TASK_COMPLETION = "TASK_COMPLETION", "Task Completion"
        MANUAL_UPDATE = "MANUAL_UPDATE", "Manual Update"
        RESTOCK = "RESTOCK", "Restock"

    supply = models.ForeignKey(
        Supply, on_delete=models.CASCADE, related_name="consumption_logs"
    )
    occurrence = models.ForeignKey(
        "schedules.Occurrence",
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="consumption_logs",
    )

    expected_quantity = models.DecimalField(
        max_digits=10, decimal_places=2, null=True, blank=True
    )
    actual_quantity = models.DecimalField(max_digits=10, decimal_places=2)
    adjustment_type = models.CharField(max_length=20, choices=AdjustmentType.choices)

    geotag_lat = models.DecimalField(
        max_digits=9, decimal_places=6, null=True, blank=True
    )
    geotag_lng = models.DecimalField(
        max_digits=9, decimal_places=6, null=True, blank=True
    )

    logged_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        related_name="consumption_logs_recorded",
    )

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"{self.supply.name}: -{self.actual_quantity} ({self.adjustment_type})"


class SupplyForecast(TimestampedModel):
    """Cached daily-computed projection, not calculated live on every
    request -- refreshed by the daily forecasting batch job.
    """

    supply = models.OneToOneField(
        Supply, on_delete=models.CASCADE, primary_key=True, related_name="forecast"
    )
    daily_usage_rate = models.DecimalField(
        max_digits=10, decimal_places=2, null=True, blank=True
    )
    predicted_empty_date = models.DateField(null=True, blank=True)
    last_computed_at = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return f"Forecast for {self.supply.name}"

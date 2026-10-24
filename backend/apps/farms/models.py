from django.conf import settings
from django.db import models

from apps.core.models import ArchivableModel, TimestampedModel, UUIDModel


class Farm(UUIDModel, TimestampedModel):
    class PlanTier(models.TextChoices):
        FREE = "FREE", "Free"
        TIER_1 = "TIER_1", "Tier 1"
        TIER_2 = "TIER_2", "Tier 2"
        TIER_3 = "TIER_3", "Tier 3"

    name = models.CharField(max_length=255)
    owner = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="owned_farms",
    )
    location = models.CharField(max_length=255, blank=True)
    # IANA tz name (e.g. "Asia/Kolkata"); validated at the API layer, not here.
    timezone = models.CharField(max_length=64, default="UTC")

    # Module gating from onboarding — which domains this farm actually uses.
    has_animals = models.BooleanField(default=False)
    has_plants = models.BooleanField(default=False)
    has_fungi = models.BooleanField(default=False)
    has_fish = models.BooleanField(default=False)

    plan_tier = models.CharField(
        max_length=16, choices=PlanTier.choices, default=PlanTier.FREE
    )
    stripe_customer_id = models.CharField(max_length=255, blank=True)
    stripe_subscription_id = models.CharField(max_length=255, blank=True)

    def __str__(self):
        return self.name


class Zone(UUIDModel, TimestampedModel, ArchivableModel):
    class ZoneType(models.TextChoices):
        PLOT = "PLOT", "Plot"
        PEN = "PEN", "Pen"
        COOP = "COOP", "Coop"
        POND = "POND", "Pond"
        SHED = "SHED", "Shed"
        STORAGE = "STORAGE", "Storage"
        OTHER = "OTHER", "Other"

    farm = models.ForeignKey(Farm, on_delete=models.CASCADE, related_name="zones")
    name = models.CharField(max_length=255)
    zone_type = models.CharField(max_length=16, choices=ZoneType.choices)
    capacity = models.DecimalField(
        max_digits=10, decimal_places=2, null=True, blank=True
    )

    def __str__(self):
        return f"{self.name} ({self.farm.name})"

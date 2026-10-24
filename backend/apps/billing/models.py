from django.db import models

from apps.core.models import TimestampedModel, UUIDModel
from apps.farms.models import Farm


class SubscriptionEvent(UUIDModel, TimestampedModel):
    """Raw log of Stripe webhook events. Plan/tier itself lives on Farm --
    this is purely a debugging/audit trail of what Stripe told us and when.
    """

    # Nullable: a webhook can arrive before the farm is resolvable (bad
    # reference, unrelated Stripe account event) -- we still want to keep
    # the raw payload for debugging rather than reject it outright.
    farm = models.ForeignKey(
        Farm,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="subscription_events",
    )
    # Unique for webhook idempotency -- Stripe can and will redeliver the
    # same event; this is how a handler recognizes and skips a duplicate.
    stripe_event_id = models.CharField(max_length=255, unique=True)
    event_type = models.CharField(max_length=100)
    payload = models.JSONField()
    processed_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"{self.event_type} ({self.farm.name})"

from django.conf import settings
from django.db import models

from apps.core.models import TimestampedModel, UUIDModel
from apps.farms.models import Farm


class DeviceToken(UUIDModel, TimestampedModel):
    class Platform(models.TextChoices):
        IOS = "IOS", "iOS"
        ANDROID = "ANDROID", "Android"

    user = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name="device_tokens"
    )
    # Unique, not per-user: the same physical device/token can be
    # re-registered under a different user (e.g. farmhand logs out, owner
    # logs in on the same phone) -- registration is an upsert on this field.
    fcm_token = models.CharField(max_length=255, unique=True)
    platform = models.CharField(max_length=16, choices=Platform.choices)

    def __str__(self):
        return f"{self.user.email} ({self.platform})"


class Notification(UUIDModel, TimestampedModel):
    class NotificationType(models.TextChoices):
        LOW_STOCK = "LOW_STOCK", "Low Stock"
        TASK_OVERDUE = "TASK_OVERDUE", "Task Overdue"
        ROLE_CHANGED = "ROLE_CHANGED", "Role Changed"
        GENERAL = "GENERAL", "General"

    farm = models.ForeignKey(Farm, on_delete=models.CASCADE, related_name="notifications")
    # Null = farm-wide broadcast rather than a specific recipient.
    recipient = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="notifications",
    )

    notification_type = models.CharField(max_length=20, choices=NotificationType.choices)
    title = models.CharField(max_length=255)
    body = models.TextField(blank=True)

    # Same plain-string-reference pattern as AuditLogEntry, for consistency.
    related_object_type = models.CharField(max_length=100, blank=True)
    related_object_id = models.UUIDField(null=True, blank=True)

    is_read = models.BooleanField(default=False)

    class Meta:
        ordering = ["-created_at"]
        indexes = [models.Index(fields=["recipient", "is_read"])]

    def __str__(self):
        return f"{self.notification_type}: {self.title}"

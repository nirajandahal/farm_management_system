from django.conf import settings
from django.db import models

from apps.core.models import TimestampedModel, UUIDModel
from apps.farms.models import Farm


class AuditLogEntry(UUIDModel, TimestampedModel):
    class Action(models.TextChoices):
        CREATE = "CREATE", "Create"
        UPDATE = "UPDATE", "Update"
        DELETE = "DELETE", "Delete"
        COMPLETE = "COMPLETE", "Complete"
        SKIP = "SKIP", "Skip"
        ARCHIVE = "ARCHIVE", "Archive"
        RESTORE = "RESTORE", "Restore"
        ROLE_CHANGE = "ROLE_CHANGE", "Role Change"
        MODULE_ENABLED = "MODULE_ENABLED", "Module Enabled"
        MODULE_DISABLED = "MODULE_DISABLED", "Module Disabled"

    class Category(models.TextChoices):
        HEALTH = "HEALTH", "Health"
        SUPPLY = "SUPPLY", "Supply"
        MANAGEMENT = "MANAGEMENT", "Management"
        SCHEDULE = "SCHEDULE", "Schedule"
        TEAM = "TEAM", "Team"

    farm = models.ForeignKey(Farm, on_delete=models.CASCADE, related_name="audit_entries")
    actor = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="audit_entries",
    )

    action = models.CharField(max_length=20, choices=Action.choices)
    category = models.CharField(max_length=16, choices=Category.choices)

    # Plain string reference rather than a GenericForeignKey -- keeps the
    # log human-readable directly in the DB without joining content_type,
    # and survives even if the target row is later hard-deleted.
    target_model = models.CharField(max_length=100)
    target_id = models.UUIDField()
    target_display_name = models.CharField(max_length=255)

    reference_id = models.CharField(max_length=50, blank=True)
    description = models.TextField(blank=True)

    # Retention tiering: local device keeps ~6 months, server keeps
    # everything but tags older entries as cold-archived rather than
    # deleting them. Distinct from ArchivableModel's "hidden from the
    # farmer's active view" meaning used elsewhere.
    is_cold_archived = models.BooleanField(default=False)
    cold_archived_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        ordering = ["-created_at"]
        indexes = [
            models.Index(fields=["farm", "-created_at"]),
            models.Index(fields=["farm", "category"]),
        ]

    def __str__(self):
        return f"[{self.category}] {self.action} on {self.target_display_name}"

    @classmethod
    def record(cls, *, farm, actor, action, category, target, description="", reference_id=""):
        """Convenience for the "explicit call in each view" pattern --
        derives target_model/target_id/target_display_name from the target
        object itself so call sites stay a single short, hard-to-get-wrong
        line rather than repeating that boilerplate everywhere.
        """
        return cls.objects.create(
            farm=farm,
            actor=actor,
            action=action,
            category=category,
            target_model=target.__class__.__name__,
            target_id=target.pk,
            target_display_name=str(target),
            description=description,
            reference_id=reference_id,
        )

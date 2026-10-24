from datetime import timedelta

from django.conf import settings
from django.contrib.postgres.fields import ArrayField
from django.db import models

from apps.core.models import TimestampedModel, UUIDModel
from apps.farms.models import Farm, Zone
from apps.inventory.models import LivingInventoryItem
from apps.supplies.models import ConsumptionLogEntry, Supply


class Schedule(UUIDModel, TimestampedModel):
    class ScheduleType(models.TextChoices):
        ONE_TIME = "ONE_TIME", "One-Time"
        RECURRING = "RECURRING", "Recurring"

    class RecurrenceFrequency(models.TextChoices):
        DAILY = "DAILY", "Daily"
        WEEKLY = "WEEKLY", "Weekly"

    class Urgency(models.TextChoices):
        URGENT = "URGENT", "Urgent"
        ROUTINE = "ROUTINE", "Routine"
        ADMIN = "ADMIN", "Admin"

    farm = models.ForeignKey(Farm, on_delete=models.CASCADE, related_name="schedules")
    title = models.CharField(max_length=255)
    schedule_type = models.CharField(max_length=16, choices=ScheduleType.choices)

    # Recurrence config: simple structured fields (not full RRULE) --
    # deliberately only covers "every N days" / "specific weekdays", which
    # is everything the product actually needs.
    recurrence_frequency = models.CharField(
        max_length=16, choices=RecurrenceFrequency.choices, null=True, blank=True
    )
    recurrence_interval = models.PositiveIntegerField(
        null=True, blank=True, help_text="Every N days (DAILY) or N weeks (WEEKLY)"
    )
    recurrence_days_of_week = ArrayField(
        models.PositiveSmallIntegerField(),
        null=True,
        blank=True,
        help_text="0=Monday .. 6=Sunday, used for WEEKLY frequency",
    )

    # Anchor dates -- required to compute occurrence dates at all.
    start_date = models.DateField()
    end_date = models.DateField(null=True, blank=True)

    linked_zone = models.ForeignKey(
        Zone, on_delete=models.SET_NULL, null=True, blank=True, related_name="schedules"
    )
    linked_inventory_item = models.ForeignKey(
        LivingInventoryItem,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="schedules",
    )
    linked_supply = models.ForeignKey(
        Supply, on_delete=models.SET_NULL, null=True, blank=True, related_name="schedules"
    )
    expected_quantity = models.DecimalField(
        max_digits=10, decimal_places=2, null=True, blank=True
    )

    alarm_enabled = models.BooleanField(default=False)
    alarm_time = models.TimeField(null=True, blank=True)

    urgency = models.CharField(
        max_length=16, choices=Urgency.choices, default=Urgency.ROUTINE
    )
    assigned_to = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="assigned_schedules",
    )
    created_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="created_schedules",
    )

    is_active = models.BooleanField(default=True)

    def __str__(self):
        return self.title

    def _matches_recurrence(self, candidate_date):
        interval = self.recurrence_interval or 1
        if self.recurrence_frequency == self.RecurrenceFrequency.DAILY:
            return (candidate_date - self.start_date).days % interval == 0
        if self.recurrence_frequency == self.RecurrenceFrequency.WEEKLY:
            if self.recurrence_days_of_week and candidate_date.weekday() not in self.recurrence_days_of_week:
                return False
            weeks_elapsed = (candidate_date - self.start_date).days // 7
            return weeks_elapsed % interval == 0
        return False

    def generate_occurrences(self, until_date):
        """Create Occurrence rows for this schedule up to (and including)
        until_date. Idempotent -- skips dates that already have one.
        """
        if not self.is_active or self.start_date > until_date:
            return []

        existing_dates = set(self.occurrences.values_list("due_date", flat=True))

        if self.schedule_type == self.ScheduleType.ONE_TIME:
            candidate_dates = (
                [self.start_date] if self.start_date not in existing_dates else []
            )
        else:
            end = min(self.end_date, until_date) if self.end_date else until_date
            candidate_dates = []
            current = self.start_date
            while current <= end:
                if current not in existing_dates and self._matches_recurrence(current):
                    candidate_dates.append(current)
                current += timedelta(days=1)

        return [
            Occurrence.objects.create(
                schedule=self,
                title=self.title,
                urgency=self.urgency,
                due_date=due_date,
                due_time=self.alarm_time,
            )
            for due_date in candidate_dates
        ]


class Occurrence(UUIDModel, TimestampedModel):
    class Status(models.TextChoices):
        PENDING = "PENDING", "Pending"
        COMPLETED = "COMPLETED", "Completed"
        SKIPPED = "SKIPPED", "Skipped"
        OVERDUE = "OVERDUE", "Overdue"
        MISSED = "MISSED", "Missed"

    schedule = models.ForeignKey(
        Schedule, on_delete=models.CASCADE, related_name="occurrences"
    )
    # Denormalized from schedule at creation time so the mobile home screen
    # can render a day's list from Occurrence rows alone.
    title = models.CharField(max_length=255)
    # Same reasoning as title -- denormalized from schedule.urgency at
    # generation time so the home screen's urgency badge doesn't need a
    # join back to Schedule for every item in the list.
    urgency = models.CharField(
        max_length=16, choices=Schedule.Urgency.choices, default=Schedule.Urgency.ROUTINE
    )

    due_date = models.DateField()
    due_time = models.TimeField(null=True, blank=True)
    status = models.CharField(
        max_length=16, choices=Status.choices, default=Status.PENDING
    )

    completed_at = models.DateTimeField(null=True, blank=True)
    completed_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="occurrences_completed",
    )
    actual_quantity = models.DecimalField(
        max_digits=10, decimal_places=2, null=True, blank=True
    )

    skip_reason = models.TextField(blank=True)
    note = models.TextField(blank=True)

    geotag_lat = models.DecimalField(
        max_digits=9, decimal_places=6, null=True, blank=True
    )
    geotag_lng = models.DecimalField(
        max_digits=9, decimal_places=6, null=True, blank=True
    )

    class Meta:
        unique_together = ("schedule", "due_date")
        ordering = ["due_date", "due_time"]

    def __str__(self):
        return f"{self.title} - {self.due_date}"

    def mark_complete(
        self, completed_by, actual_quantity=None, geotag_lat=None, geotag_lng=None, note=""
    ):
        """Swipe-to-complete: marks done and, if this task is tied to a
        supply, auto-deducts the confirmed quantity and logs it.
        """
        from django.utils import timezone

        self.status = self.Status.COMPLETED
        self.completed_at = timezone.now()
        self.completed_by = completed_by
        self.actual_quantity = (
            actual_quantity if actual_quantity is not None else self.schedule.expected_quantity
        )
        self.geotag_lat = geotag_lat
        self.geotag_lng = geotag_lng
        self.note = note
        self.save()

        supply = self.schedule.linked_supply
        if supply is not None and self.actual_quantity is not None:
            ConsumptionLogEntry.objects.create(
                supply=supply,
                occurrence=self,
                expected_quantity=self.schedule.expected_quantity,
                actual_quantity=self.actual_quantity,
                adjustment_type=ConsumptionLogEntry.AdjustmentType.TASK_COMPLETION,
                logged_by=completed_by,
                geotag_lat=geotag_lat,
                geotag_lng=geotag_lng,
            )
            supply.current_stock = supply.current_stock - self.actual_quantity
            supply.save()

        return self

    def mark_skipped(self, reason=""):
        self.status = self.Status.SKIPPED
        self.skip_reason = reason
        self.save()
        return self

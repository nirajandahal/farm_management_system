from datetime import date, timedelta
from decimal import Decimal

from celery import shared_task
from django.db.models import Sum
from django.utils import timezone

from apps.notifications.models import Notification
from apps.schedules.models import Occurrence, Schedule

from .models import ConsumptionLogEntry, Supply, SupplyForecast

LOOKBACK_DAYS = 14


@shared_task
def recompute_supply_forecasts():
    """Runs daily. For each supply, computes a daily usage rate from recent
    consumption history and projects an empty date. Crossing the supply's
    reorder threshold auto-creates a one-time URGENT schedule (-> todo item)
    plus a LOW_STOCK notification, guarded against creating a duplicate
    while one is already pending.

    Deliberate simplification: only TASK_COMPLETION log entries count as
    consumption. MANUAL_UPDATE entries are stored as an unsigned magnitude
    (see SupplyViewSet.stock_adjustment) so a manual correction could be an
    increase or a decrease -- without that direction preserved, including
    them here would silently corrupt the rate. RESTOCK entries obviously
    aren't consumption at all. This is a starting-point algorithm, not the
    "near-accurate" adaptive version -- that's the still-unbuilt Tier 2
    recalibration feature.
    """
    since = timezone.now() - timedelta(days=LOOKBACK_DAYS)
    forecasts_updated = 0
    reorder_alerts_created = 0

    for supply in Supply.objects.filter(is_archived=False):
        total_consumed = supply.consumption_logs.filter(
            adjustment_type=ConsumptionLogEntry.AdjustmentType.TASK_COMPLETION,
            created_at__gte=since,
        ).aggregate(total=Sum("actual_quantity"))["total"] or Decimal("0")

        if total_consumed <= 0:
            continue  # not enough data to forecast yet

        daily_usage_rate = total_consumed / LOOKBACK_DAYS
        days_remaining = supply.current_stock / daily_usage_rate
        predicted_empty_date = date.today() + timedelta(days=float(days_remaining))

        SupplyForecast.objects.update_or_create(
            supply=supply,
            defaults={
                "daily_usage_rate": daily_usage_rate,
                "predicted_empty_date": predicted_empty_date,
                "last_computed_at": timezone.now(),
            },
        )
        forecasts_updated += 1

        threshold = supply.reorder_threshold_days
        if threshold is None or days_remaining > threshold:
            continue

        already_pending = Occurrence.objects.filter(
            schedule__linked_supply=supply,
            schedule__urgency=Schedule.Urgency.URGENT,
            status=Occurrence.Status.PENDING,
        ).exists()
        if already_pending:
            continue

        reorder_schedule = Schedule.objects.create(
            farm=supply.farm,
            title=f"Reorder {supply.name}",
            schedule_type=Schedule.ScheduleType.ONE_TIME,
            start_date=date.today(),
            linked_supply=supply,
            urgency=Schedule.Urgency.URGENT,
        )
        reorder_schedule.generate_occurrences(until_date=date.today())

        Notification.objects.create(
            farm=supply.farm,
            notification_type=Notification.NotificationType.LOW_STOCK,
            title=f"{supply.name} running low",
            body=f"Predicted to run out around {predicted_empty_date.isoformat()} "
                 f"({days_remaining:.1f} days remaining).",
            related_object_type="Supply",
            related_object_id=supply.id,
        )
        reorder_alerts_created += 1

    return {"forecasts_updated": forecasts_updated, "reorder_alerts_created": reorder_alerts_created}

from datetime import date, timedelta

from celery import shared_task

from .models import Schedule


@shared_task
def generate_upcoming_occurrences(horizon_days=21):
    """Runs daily. Ensures every active schedule has Occurrence rows out to
    `horizon_days` from today. Idempotent (Schedule.generate_occurrences
    skips dates that already have a row), so this is safe to run more
    often than strictly necessary and self-heals a missed run.
    """
    until_date = date.today() + timedelta(days=horizon_days)
    schedules = Schedule.objects.filter(is_active=True)

    total_created = 0
    for schedule in schedules:
        total_created += len(schedule.generate_occurrences(until_date=until_date))

    return {"schedules_processed": schedules.count(), "occurrences_created": total_created}

from django.contrib import admin

from .models import Occurrence, Schedule


@admin.register(Schedule)
class ScheduleAdmin(admin.ModelAdmin):
    list_display = (
        "title", "farm", "schedule_type", "urgency", "assigned_to",
        "start_date", "is_active",
    )
    list_filter = ("schedule_type", "urgency", "is_active", "farm")
    search_fields = ("title",)


@admin.register(Occurrence)
class OccurrenceAdmin(admin.ModelAdmin):
    list_display = (
        "title", "schedule", "due_date", "due_time", "status", "completed_by",
    )
    list_filter = ("status", "due_date")
    search_fields = ("title",)

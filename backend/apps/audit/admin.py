from django.contrib import admin

from .models import AuditLogEntry


@admin.register(AuditLogEntry)
class AuditLogEntryAdmin(admin.ModelAdmin):
    list_display = (
        "created_at", "farm", "category", "action", "target_display_name",
        "actor", "reference_id", "is_cold_archived",
    )
    list_filter = ("category", "action", "is_cold_archived", "farm")
    search_fields = ("target_display_name", "reference_id", "description")
    date_hierarchy = "created_at"

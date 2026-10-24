from django.contrib import admin

from .models import SubscriptionEvent


@admin.register(SubscriptionEvent)
class SubscriptionEventAdmin(admin.ModelAdmin):
    list_display = ("stripe_event_id", "event_type", "farm", "processed_at", "created_at")
    list_filter = ("event_type",)
    search_fields = ("stripe_event_id", "farm__name")

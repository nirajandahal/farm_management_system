from django.contrib import admin

from .models import DeviceToken, Notification


@admin.register(DeviceToken)
class DeviceTokenAdmin(admin.ModelAdmin):
    list_display = ("user", "platform", "created_at")
    list_filter = ("platform",)
    search_fields = ("user__email", "fcm_token")


@admin.register(Notification)
class NotificationAdmin(admin.ModelAdmin):
    list_display = (
        "title", "notification_type", "farm", "recipient", "is_read", "created_at",
    )
    list_filter = ("notification_type", "is_read", "farm")
    search_fields = ("title", "body")

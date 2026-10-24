from rest_framework import serializers

from .models import DeviceToken, Notification


class DeviceTokenSerializer(serializers.ModelSerializer):
    class Meta:
        model = DeviceToken
        fields = ["id", "fcm_token", "platform"]
        read_only_fields = ["id"]


class NotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notification
        fields = [
            "id", "notification_type", "title", "body",
            "related_object_type", "related_object_id", "is_read", "created_at",
        ]
        read_only_fields = fields

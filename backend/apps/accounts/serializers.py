from rest_framework import serializers

from .models import User


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            "id", "email", "full_name", "phone", "photo_url",
            "role", "farm", "auth_provider",
        ]
        read_only_fields = ["id", "email", "role", "farm", "auth_provider"]


class SocialLoginSerializer(serializers.Serializer):
    id_token = serializers.CharField()


class DevLoginSerializer(serializers.Serializer):
    email = serializers.EmailField()


class TeamInviteSerializer(serializers.Serializer):
    email = serializers.EmailField()


class RoleChangeSerializer(serializers.Serializer):
    role = serializers.ChoiceField(choices=User.Role.choices)

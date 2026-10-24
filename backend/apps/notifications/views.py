from django.db.models import Q
from rest_framework import generics, permissions, status
from rest_framework.exceptions import ValidationError
from rest_framework.response import Response
from rest_framework.views import APIView

from .models import DeviceToken, Notification
from .serializers import DeviceTokenSerializer, NotificationSerializer


class DeviceTokenRegisterView(APIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = DeviceTokenSerializer

    def post(self, request):
        serializer = DeviceTokenSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        # Upsert on fcm_token: a device can be re-registered to a different
        # user (logout/login on shared hardware) rather than erroring.
        token, _ = DeviceToken.objects.update_or_create(
            fcm_token=serializer.validated_data["fcm_token"],
            defaults={"user": request.user, "platform": serializer.validated_data["platform"]},
        )
        return Response(DeviceTokenSerializer(token).data, status=status.HTTP_200_OK)

    def delete(self, request):
        fcm_token = request.data.get("fcm_token")
        if not fcm_token:
            raise ValidationError({"fcm_token": "This field is required."})
        DeviceToken.objects.filter(fcm_token=fcm_token, user=request.user).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class NotificationListView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = NotificationSerializer

    def get_queryset(self):
        if getattr(self, "swagger_fake_view", False):
            return Notification.objects.none()
        user = self.request.user
        return Notification.objects.filter(farm=user.farm).filter(
            Q(recipient=user) | Q(recipient__isnull=True)
        )


class NotificationMarkReadView(APIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = NotificationSerializer

    def patch(self, request, pk):
        notification = generics.get_object_or_404(
            Notification.objects.filter(farm=request.user.farm), pk=pk
        )
        notification.is_read = True
        notification.save()
        return Response(NotificationSerializer(notification).data)

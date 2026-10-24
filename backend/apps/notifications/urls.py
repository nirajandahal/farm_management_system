from django.urls import path

from .views import DeviceTokenRegisterView, NotificationListView, NotificationMarkReadView

urlpatterns = [
    path("notifications/register-device/", DeviceTokenRegisterView.as_view(), name="register-device"),
    path("notifications/", NotificationListView.as_view(), name="notification-list"),
    path("notifications/<uuid:pk>/read/", NotificationMarkReadView.as_view(), name="notification-read"),
]

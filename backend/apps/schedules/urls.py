from django.urls import include, path
from rest_framework.routers import DefaultRouter

from .views import OccurrenceViewSet, ScheduleViewSet

router = DefaultRouter()
router.register("schedules", ScheduleViewSet, basename="schedule")
router.register("occurrences", OccurrenceViewSet, basename="occurrence")

urlpatterns = [
    path("", include(router.urls)),
]

from rest_framework.routers import DefaultRouter

from django.urls import include, path

from .views import FarmDetailView, FarmModulesView, ZoneViewSet

router = DefaultRouter()
router.register("zones", ZoneViewSet, basename="zone")

urlpatterns = [
    path("farm/", FarmDetailView.as_view(), name="farm-detail"),
    path("farm/modules/", FarmModulesView.as_view(), name="farm-modules"),
    path("", include(router.urls)),
]

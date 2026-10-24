from django.urls import include, path
from rest_framework.routers import DefaultRouter

from .views import (
    BreedingLogListCreateView,
    HealthLogListCreateView,
    LivingInventoryItemViewSet,
    ProductionLogListCreateView,
)

router = DefaultRouter()
router.register("inventory", LivingInventoryItemViewSet, basename="inventory-item")

urlpatterns = [
    path("", include(router.urls)),
    path("inventory/<uuid:item_id>/health-log/", HealthLogListCreateView.as_view(), name="inventory-health-log"),
    path("inventory/<uuid:item_id>/production-log/", ProductionLogListCreateView.as_view(), name="inventory-production-log"),
    path("inventory/<uuid:item_id>/breeding-log/", BreedingLogListCreateView.as_view(), name="inventory-breeding-log"),
]

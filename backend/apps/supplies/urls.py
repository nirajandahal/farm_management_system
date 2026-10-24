from django.urls import include, path
from rest_framework.routers import DefaultRouter

from .views import SupplyViewSet

router = DefaultRouter()
router.register("supplies", SupplyViewSet, basename="supply")

urlpatterns = [
    path("", include(router.urls)),
]

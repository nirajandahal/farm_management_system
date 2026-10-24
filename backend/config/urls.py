from django.contrib import admin
from django.urls import include, path
from drf_spectacular.views import SpectacularAPIView, SpectacularSwaggerView
from rest_framework_simplejwt.views import TokenRefreshView

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/v1/auth/token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
    path("api/v1/", include("apps.accounts.urls")),
    path("api/v1/", include("apps.farms.urls")),
    path("api/v1/", include("apps.inventory.urls")),
    path("api/v1/", include("apps.supplies.urls")),
    path("api/v1/", include("apps.schedules.urls")),
    path("api/v1/", include("apps.audit.urls")),
    path("api/v1/", include("apps.notifications.urls")),
    path("api/v1/", include("apps.billing.urls")),
    path("api/schema/", SpectacularAPIView.as_view(), name="schema"),
    path("api/docs/", SpectacularSwaggerView.as_view(url_name="schema"), name="docs"),
]

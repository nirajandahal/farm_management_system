from django.urls import path

from .views import (
    AppleLoginView,
    DevLoginView,
    GoogleLoginView,
    MeView,
    TeamInviteView,
    TeamListView,
    TeamMemberDetailView,
)

urlpatterns = [
    path("auth/social/google/", GoogleLoginView.as_view(), name="social-login-google"),
    path("auth/social/apple/", AppleLoginView.as_view(), name="social-login-apple"),
    path("auth/dev-login/", DevLoginView.as_view(), name="dev-login"),
    path("me/", MeView.as_view(), name="me"),
    path("team/", TeamListView.as_view(), name="team-list"),
    path("team/invite/", TeamInviteView.as_view(), name="team-invite"),
    path("team/<uuid:user_id>/", TeamMemberDetailView.as_view(), name="team-member-detail"),
]

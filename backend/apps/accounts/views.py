from django.conf import settings
from django.http import Http404
from django.shortcuts import get_object_or_404
from rest_framework import generics, status
from rest_framework.exceptions import ValidationError
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken

from apps.audit.models import AuditLogEntry
from apps.core.permissions import IsFarmAdmin

from . import services
from .models import User
from .serializers import (
    DevLoginSerializer,
    RoleChangeSerializer,
    SocialLoginSerializer,
    TeamInviteSerializer,
    UserSerializer,
)


class SocialLoginView(APIView):
    """Base for the Google/Apple login endpoints. Exchanges a verified
    provider ID token for this app's own JWT pair, creating the user (or
    claiming a pre-invited placeholder account by email) on first login.
    """

    permission_classes = [AllowAny]
    serializer_class = SocialLoginSerializer
    provider = None
    verify = None

    def post(self, request):
        token = request.data.get("id_token")
        if not token:
            raise ValidationError({"id_token": "This field is required."})

        try:
            info = self.verify(token)
        except Exception:
            return Response({"detail": "Invalid or expired token."}, status=status.HTTP_401_UNAUTHORIZED)

        user = User.objects.filter(
            auth_provider=self.provider, provider_uid=info["uid"]
        ).first()

        if user is None:
            # Claim a pre-invited placeholder (admin invited this email,
            # they haven't signed in yet) instead of creating a duplicate.
            invited = User.objects.filter(
                email=info["email"], auth_provider__isnull=True
            ).first()
            if invited:
                invited.auth_provider = self.provider
                invited.provider_uid = info["uid"]
                invited.full_name = invited.full_name or info.get("full_name", "")
                invited.photo_url = info.get("photo_url", "")
                invited.save()
                user = invited
            else:
                user = User.objects.create_user(
                    email=info["email"],
                    auth_provider=self.provider,
                    provider_uid=info["uid"],
                    full_name=info.get("full_name", ""),
                    photo_url=info.get("photo_url", ""),
                )

        refresh = RefreshToken.for_user(user)
        return Response({
            "access": str(refresh.access_token),
            "refresh": str(refresh),
            "user": UserSerializer(user).data,
        })


class GoogleLoginView(SocialLoginView):
    provider = User.AuthProvider.GOOGLE

    def verify(self, token):
        # Looked up through the module at call time (not imported as a bare
        # name) so it stays patchable -- `from x import y` binds a
        # permanent reference at import time, which breaks mocking here
        # since Django imports views lazily on first URL resolution.
        return services.verify_google_token(token)


class AppleLoginView(SocialLoginView):
    provider = User.AuthProvider.APPLE

    def verify(self, token):
        return services.verify_apple_token(token)


class MeView(generics.RetrieveUpdateAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserSerializer

    def get_object(self):
        return self.request.user


class TeamListView(generics.ListAPIView):
    permission_classes = [IsAuthenticated, IsFarmAdmin]
    serializer_class = UserSerializer

    def get_queryset(self):
        if getattr(self, "swagger_fake_view", False):
            return User.objects.none()
        return User.objects.filter(farm=self.request.user.farm)


class TeamInviteView(APIView):
    permission_classes = [IsAuthenticated, IsFarmAdmin]
    serializer_class = TeamInviteSerializer

    def post(self, request):
        email = request.data.get("email")
        if not email:
            raise ValidationError({"email": "This field is required."})
        if User.objects.filter(email=email).exists():
            return Response(
                {"detail": "A user with this email already exists."},
                status=status.HTTP_400_BAD_REQUEST,
            )

        invitee = User(email=email, farm=request.user.farm, role=User.Role.FARMHAND)
        invitee.set_unusable_password()
        invitee.save()

        AuditLogEntry.record(
            farm=request.user.farm,
            actor=request.user,
            action=AuditLogEntry.Action.CREATE,
            category=AuditLogEntry.Category.TEAM,
            target=invitee,
            description=f"Invited {email} as a Farmhand",
        )
        return Response(UserSerializer(invitee).data, status=status.HTTP_201_CREATED)


class TeamMemberDetailView(APIView):
    permission_classes = [IsAuthenticated, IsFarmAdmin]
    serializer_class = RoleChangeSerializer

    def patch(self, request, user_id):
        target = get_object_or_404(User, id=user_id, farm=request.user.farm)
        new_role = request.data.get("role")
        if new_role not in User.Role.values:
            raise ValidationError({"role": f"Must be one of {User.Role.values}."})

        old_role = target.role
        target.role = new_role
        target.save()

        AuditLogEntry.record(
            farm=request.user.farm,
            actor=request.user,
            action=AuditLogEntry.Action.ROLE_CHANGE,
            category=AuditLogEntry.Category.TEAM,
            target=target,
            description=f"Changed role from {old_role} to {new_role}",
        )
        return Response(UserSerializer(target).data)

    def delete(self, request, user_id):
        target = get_object_or_404(User, id=user_id, farm=request.user.farm)
        AuditLogEntry.record(
            farm=request.user.farm,
            actor=request.user,
            action=AuditLogEntry.Action.UPDATE,
            category=AuditLogEntry.Category.TEAM,
            target=target,
            description=f"Removed {target.email} from the farm",
        )
        # Detach rather than delete the account -- consistent with the
        # archive-don't-delete approach used elsewhere.
        target.farm = None
        target.role = None
        target.save()
        return Response(status=status.HTTP_204_NO_CONTENT)


class DevLoginView(APIView):
    """DEBUG-only shortcut that mints a token pair for an existing user by
    email, bypassing real social-provider verification. Lets the mobile
    app's full login round trip (button tap -> API call -> token storage ->
    profile fetch -> navigation) be tested before real Google/Apple
    credentials are configured. 404s in any non-DEBUG environment so this
    can never be reachable in production.
    """

    permission_classes = [AllowAny]
    serializer_class = DevLoginSerializer

    def post(self, request):
        if not settings.DEBUG:
            raise Http404

        email = request.data.get("email")
        if not email:
            raise ValidationError({"email": "This field is required."})

        user = get_object_or_404(User, email=email)
        refresh = RefreshToken.for_user(user)
        return Response({
            "access": str(refresh.access_token),
            "refresh": str(refresh),
            "user": UserSerializer(user).data,
        })

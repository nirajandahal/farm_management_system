from rest_framework.permissions import BasePermission


class IsFarmMember(BasePermission):
    """Any authenticated user who belongs to a farm (Admin or Farmhand)."""

    def has_permission(self, request, view):
        return bool(
            request.user
            and request.user.is_authenticated
            and request.user.farm_id
        )


class IsFarmAdmin(BasePermission):
    """Admin-only: team management, audit, analytics, schedule/rule editing."""

    def has_permission(self, request, view):
        return bool(
            request.user
            and request.user.is_authenticated
            and request.user.role == request.user.Role.ADMIN
        )


def require_plan_tier(*allowed_tiers):
    """Factory for a permission class gating a view to specific farm plan
    tiers, independent of the user's role -- a Free-tier Admin and a
    Free-tier Farmhand both get denied the same way.
    """

    class _HasPlanTier(BasePermission):
        def has_permission(self, request, view):
            farm = getattr(request.user, "farm", None)
            return bool(farm and farm.plan_tier in allowed_tiers)

    return _HasPlanTier

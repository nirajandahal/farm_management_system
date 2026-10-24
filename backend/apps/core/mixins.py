class FarmScopedQuerysetMixin:
    """Nearly every resource in this system belongs to exactly one farm --
    this scopes a viewset's queryset to request.user.farm automatically so
    that isn't repeated in every view.
    """

    farm_field = "farm"

    def get_queryset(self):
        qs = super().get_queryset()
        farm = getattr(self.request.user, "farm", None)
        if farm is None:
            return qs.none()
        return qs.filter(**{self.farm_field: farm})

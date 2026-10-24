import uuid

from django.db import models


class UUIDModel(models.Model):
    """Base model with a client-generatable UUID primary key.

    Needed so records created offline on the mobile app can carry their own
    ID and sync up later without waiting for a server-assigned integer PK.
    """

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)

    class Meta:
        abstract = True


class TimestampedModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class ArchivableModel(models.Model):
    """Archive-not-delete: disabling a module or removing a record hides it
    without destroying history that audit/forecasting may still need.
    """

    is_archived = models.BooleanField(default=False)
    archived_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        abstract = True

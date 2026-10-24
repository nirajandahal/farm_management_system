from django.contrib.auth.base_user import AbstractBaseUser, BaseUserManager
from django.contrib.auth.models import PermissionsMixin
from django.db import models

from apps.core.models import TimestampedModel, UUIDModel


class UserManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, email, password, **extra_fields):
        if not email:
            raise ValueError("Users must have an email address")
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password=None, **extra_fields):
        extra_fields.setdefault("is_staff", False)
        extra_fields.setdefault("is_superuser", False)
        return self._create_user(email, password, **extra_fields)

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)
        return self._create_user(email, password, **extra_fields)


class User(AbstractBaseUser, PermissionsMixin, UUIDModel, TimestampedModel):
    class Role(models.TextChoices):
        ADMIN = "ADMIN", "Admin"
        FARMHAND = "FARMHAND", "Farmhand"

    class AuthProvider(models.TextChoices):
        GOOGLE = "GOOGLE", "Google"
        APPLE = "APPLE", "Apple"

    email = models.EmailField(unique=True)
    full_name = models.CharField(max_length=150, blank=True)
    phone = models.CharField(max_length=32, blank=True)
    photo_url = models.URLField(blank=True)

    # Null until the user completes farm setup/is invited, or for
    # internal staff accounts that have no farm role at all.
    role = models.CharField(
        max_length=16, choices=Role.choices, null=True, blank=True
    )

    # Null for internal Django-admin staff accounts using a normal password.
    auth_provider = models.CharField(
        max_length=16, choices=AuthProvider.choices, null=True, blank=True
    )
    provider_uid = models.CharField(max_length=255, null=True, blank=True)

    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    # Null until onboarding creates/joins a farm, or for internal staff
    # accounts that have no farm membership at all.
    farm = models.ForeignKey(
        "farms.Farm",
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="members",
    )

    objects = UserManager()

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = []

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=["auth_provider", "provider_uid"],
                name="unique_provider_identity",
                condition=models.Q(provider_uid__isnull=False),
            )
        ]

    def __str__(self):
        return self.email

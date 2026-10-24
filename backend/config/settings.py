"""
Django settings for the Farmloop backend.
"""

from datetime import timedelta
from pathlib import Path

import environ
from celery.schedules import crontab

BASE_DIR = Path(__file__).resolve().parent.parent

env = environ.Env(
    DEBUG=(bool, False),
)
environ.Env.read_env(BASE_DIR / ".env")

SECRET_KEY = env("SECRET_KEY")
DEBUG = env("DEBUG")
ALLOWED_HOSTS = env.list("ALLOWED_HOSTS", default=["localhost", "127.0.0.1"])


# Application definition

INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "django.contrib.postgres",
    # third-party
    "rest_framework",
    "rest_framework_simplejwt.token_blacklist",
    "corsheaders",
    "drf_spectacular",
    "cloudinary_storage",
    "cloudinary",
    "django_filters",
    # local apps
    "apps.core",
    "apps.accounts",
    "apps.farms",
    "apps.inventory",
    "apps.supplies",
    "apps.schedules",
    "apps.audit",
    "apps.notifications",
    "apps.billing",
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "corsheaders.middleware.CorsMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]

ROOT_URLCONF = "config.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

WSGI_APPLICATION = "config.wsgi.application"


# Database
# Backed by env var so local/staging/prod just swap DATABASE_URL.

DATABASES = {
    "default": env.db("DATABASE_URL", default=f"sqlite:///{BASE_DIR / 'db.sqlite3'}"),
}


# Password validation

AUTH_PASSWORD_VALIDATORS = [
    {"NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator"},
    {"NAME": "django.contrib.auth.password_validation.MinimumLengthValidator"},
    {"NAME": "django.contrib.auth.password_validation.CommonPasswordValidator"},
    {"NAME": "django.contrib.auth.password_validation.NumericPasswordValidator"},
]

AUTH_USER_MODEL = "accounts.User"


# Internationalization

LANGUAGE_CODE = "en-us"
TIME_ZONE = "UTC"
USE_I18N = True
USE_TZ = True


# Static files

STATIC_URL = "static/"

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"


# Media storage (Cloudinary) — all uploaded photos (inventory reference
# photos, supply photos, etc.) go here rather than local disk, so they
# survive across deploys and don't need a separate CDN/serving setup.

CLOUDINARY_STORAGE = {
    "CLOUD_NAME": env("CLOUDINARY_CLOUD_NAME", default=""),
    "API_KEY": env("CLOUDINARY_API_KEY", default=""),
    "API_SECRET": env("CLOUDINARY_API_SECRET", default=""),
}

STORAGES = {
    "default": {
        "BACKEND": "cloudinary_storage.storage.MediaCloudinaryStorage",
    },
    "staticfiles": {
        "BACKEND": "django.contrib.staticfiles.storage.StaticFilesStorage",
    },
}


# CORS
# Flutter app origin(s) allowed to call the API. Tighten before production.

CORS_ALLOWED_ORIGINS = env.list("CORS_ALLOWED_ORIGINS", default=[])
CORS_ALLOW_ALL_ORIGINS = DEBUG


# Django REST Framework

REST_FRAMEWORK = {
    "DEFAULT_AUTHENTICATION_CLASSES": (
        "rest_framework_simplejwt.authentication.JWTAuthentication",
    ),
    "DEFAULT_PERMISSION_CLASSES": (
        "rest_framework.permissions.IsAuthenticated",
    ),
    "DEFAULT_SCHEMA_CLASS": "drf_spectacular.openapi.AutoSchema",
    "DEFAULT_PAGINATION_CLASS": "rest_framework.pagination.PageNumberPagination",
    "DEFAULT_FILTER_BACKENDS": ("django_filters.rest_framework.DjangoFilterBackend",),
    "PAGE_SIZE": 50,
}

# Social login + Stripe -- all optional at import time; only required when
# the corresponding endpoint is actually called.
GOOGLE_CLIENT_ID = env("GOOGLE_CLIENT_ID", default="")
APPLE_CLIENT_ID = env("APPLE_CLIENT_ID", default="")

STRIPE_SECRET_KEY = env("STRIPE_SECRET_KEY", default="")
STRIPE_WEBHOOK_SECRET = env("STRIPE_WEBHOOK_SECRET", default="")
STRIPE_PRICE_IDS = {
    "TIER_1": env("STRIPE_PRICE_TIER_1", default=""),
    "TIER_2": env("STRIPE_PRICE_TIER_2", default=""),
    "TIER_3": env("STRIPE_PRICE_TIER_3", default=""),
}
FRONTEND_BILLING_SUCCESS_URL = env("FRONTEND_BILLING_SUCCESS_URL", default="https://farmloop.app/billing/success")
FRONTEND_BILLING_CANCEL_URL = env("FRONTEND_BILLING_CANCEL_URL", default="https://farmloop.app/billing/cancel")

SIMPLE_JWT = {
    "ACCESS_TOKEN_LIFETIME": timedelta(hours=1),
    "REFRESH_TOKEN_LIFETIME": timedelta(days=30),
    "ROTATE_REFRESH_TOKENS": True,
    "BLACKLIST_AFTER_ROTATION": True,
}

SPECTACULAR_SETTINGS = {
    "TITLE": "Farmloop API",
    "DESCRIPTION": "Backend API for the Farmloop farm management app.",
    "VERSION": "1.0.0",
    "SERVE_INCLUDE_SCHEMA": False,
}


# Celery

CELERY_BROKER_URL = env("CELERY_BROKER_URL", default="redis://localhost:6379/0")
CELERY_RESULT_BACKEND = env("CELERY_RESULT_BACKEND", default="redis://localhost:6379/0")
CELERY_ACCEPT_CONTENT = ["json"]
CELERY_TASK_SERIALIZER = "json"
CELERY_RESULT_SERIALIZER = "json"
CELERY_TIMEZONE = "UTC"

# Both jobs run daily with a generous horizon rather than literally weekly:
# generation is idempotent (skips dates that already have an occurrence),
# so daily execution self-heals a missed run instead of leaving a farm
# without tasks for a week. "Today" for a specific farm is resolved using
# Farm.timezone at query time, not here -- this schedule only needs to stay
# far enough ahead to cover every farm's timezone offset.
CELERY_BEAT_SCHEDULE = {
    "generate-upcoming-occurrences": {
        "task": "apps.schedules.tasks.generate_upcoming_occurrences",
        "schedule": crontab(hour=1, minute=0),
    },
    "recompute-supply-forecasts": {
        "task": "apps.supplies.tasks.recompute_supply_forecasts",
        "schedule": crontab(hour=2, minute=0),
    },
}

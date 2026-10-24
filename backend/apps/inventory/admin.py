from django.contrib import admin

from .models import (
    AnimalDetail,
    BreedingLogEntry,
    CropDetail,
    FishDetail,
    FungiDetail,
    HealthLogEntry,
    LivingInventoryItem,
    ProductionLogEntry,
)


class AnimalDetailInline(admin.StackedInline):
    model = AnimalDetail
    extra = 0


class CropDetailInline(admin.StackedInline):
    model = CropDetail
    extra = 0


class FishDetailInline(admin.StackedInline):
    model = FishDetail
    extra = 0


class FungiDetailInline(admin.StackedInline):
    model = FungiDetail
    extra = 0


@admin.register(LivingInventoryItem)
class LivingInventoryItemAdmin(admin.ModelAdmin):
    list_display = ("name", "domain_type", "farm", "zone", "quantity", "health_status")
    list_filter = ("domain_type", "health_status", "farm")
    search_fields = ("name", "species_or_variety")
    inlines = [AnimalDetailInline, CropDetailInline, FishDetailInline, FungiDetailInline]


@admin.register(HealthLogEntry)
class HealthLogEntryAdmin(admin.ModelAdmin):
    list_display = ("item", "severity", "doctor_name", "logged_by", "created_at")
    list_filter = ("severity",)


@admin.register(ProductionLogEntry)
class ProductionLogEntryAdmin(admin.ModelAdmin):
    list_display = ("item", "individual_id_tag", "metric_type", "value", "unit", "created_at")
    list_filter = ("metric_type",)


@admin.register(BreedingLogEntry)
class BreedingLogEntryAdmin(admin.ModelAdmin):
    list_display = ("item", "individual_id_tag", "breeding_status", "expected_delivery_date")
    list_filter = ("breeding_status",)

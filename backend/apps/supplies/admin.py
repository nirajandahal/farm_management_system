from django.contrib import admin

from .models import ConsumptionLogEntry, Supply, SupplyConsumptionGroup, SupplyForecast


class SupplyConsumptionGroupInline(admin.TabularInline):
    model = SupplyConsumptionGroup
    extra = 0


class SupplyForecastInline(admin.StackedInline):
    model = SupplyForecast
    extra = 0


@admin.register(Supply)
class SupplyAdmin(admin.ModelAdmin):
    list_display = (
        "name", "category", "farm", "current_stock", "unit",
        "reorder_threshold_days", "is_archived",
    )
    list_filter = ("category", "unit", "is_archived", "farm")
    search_fields = ("name", "batch_number")
    inlines = [SupplyConsumptionGroupInline, SupplyForecastInline]


@admin.register(ConsumptionLogEntry)
class ConsumptionLogEntryAdmin(admin.ModelAdmin):
    list_display = (
        "supply", "adjustment_type", "expected_quantity", "actual_quantity",
        "logged_by", "created_at",
    )
    list_filter = ("adjustment_type",)

from django.contrib import admin

from .models import Farm, Zone


class ZoneInline(admin.TabularInline):
    model = Zone
    extra = 0


@admin.register(Farm)
class FarmAdmin(admin.ModelAdmin):
    list_display = ("name", "owner", "plan_tier", "timezone")
    list_filter = ("plan_tier", "has_animals", "has_plants", "has_fungi", "has_fish")
    search_fields = ("name",)
    inlines = [ZoneInline]


@admin.register(Zone)
class ZoneAdmin(admin.ModelAdmin):
    list_display = ("name", "farm", "zone_type", "capacity", "is_archived")
    list_filter = ("zone_type", "is_archived")
    search_fields = ("name",)

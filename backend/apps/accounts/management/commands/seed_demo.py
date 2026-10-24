from datetime import date, timedelta
from decimal import Decimal

from django.core.management.base import BaseCommand
from django.utils import timezone as djtz

from apps.accounts.models import User
from apps.audit.models import AuditLogEntry
from apps.farms.models import Farm, Zone
from apps.inventory.models import AnimalDetail, CropDetail, HealthLogEntry, LivingInventoryItem, ProductionLogEntry
from apps.schedules.models import Schedule
from apps.supplies.models import ConsumptionLogEntry, Supply, SupplyConsumptionGroup


class Command(BaseCommand):
    help = "Seeds a realistic demo farm (idempotent -- safe to run more than once)."

    def handle(self, *args, **options):
        owner, _ = User.objects.get_or_create(
            email="owner@farmloop.demo",
            defaults=dict(full_name="Jane Farmer", role=User.Role.ADMIN,
                          auth_provider=User.AuthProvider.GOOGLE, provider_uid="demo-owner-uid"),
        )
        farmhand, _ = User.objects.get_or_create(
            email="sam@farmloop.demo",
            defaults=dict(full_name="Sam Rivers", role=User.Role.FARMHAND,
                          auth_provider=User.AuthProvider.GOOGLE, provider_uid="demo-sam-uid"),
        )

        farm, _ = Farm.objects.get_or_create(
            name="Green Valley Farm",
            defaults=dict(owner=owner, location="Nashik, Maharashtra", timezone="Asia/Kolkata",
                          has_animals=True, has_plants=True, plan_tier=Farm.PlanTier.TIER_1),
        )
        owner.farm = farm
        owner.save()
        farmhand.farm = farm
        farmhand.save()

        coop, _ = Zone.objects.get_or_create(farm=farm, name="North Coop", defaults=dict(zone_type=Zone.ZoneType.COOP, capacity=50))
        pasture, _ = Zone.objects.get_or_create(farm=farm, name="South Pasture", defaults=dict(zone_type=Zone.ZoneType.PLOT))
        storage, _ = Zone.objects.get_or_create(farm=farm, name="Bin B-4", defaults=dict(zone_type=Zone.ZoneType.STORAGE))

        cows, created = LivingInventoryItem.objects.get_or_create(
            farm=farm, name="Holstein Cows",
            defaults=dict(zone=coop, domain_type=LivingInventoryItem.DomainType.ANIMAL,
                          species_or_variety="Holstein", quantity=24, health_status="HEALTHY"),
        )
        if created:
            AnimalDetail.objects.create(item=cows, breed="Holstein", avg_weight=Decimal("550.00"))
            ProductionLogEntry.objects.create(item=cows, individual_id_tag="Bella-042", metric_type="MILK_YIELD", value=Decimal("12.5"), unit="L", logged_by=farmhand)
            HealthLogEntry.objects.create(item=cows, severity="ROUTINE", doctor_name="Dr. Smith", note="Routine checkup, all healthy", logged_by=owner)

        hens, created = LivingInventoryItem.objects.get_or_create(
            farm=farm, name="Rhode Island Reds",
            defaults=dict(zone=coop, domain_type=LivingInventoryItem.DomainType.ANIMAL,
                          species_or_variety="Rhode Island Red", quantity=45, health_status="HEALTHY"),
        )
        if created:
            AnimalDetail.objects.create(item=hens, breed="Rhode Island Red")

        wheat, created = LivingInventoryItem.objects.get_or_create(
            farm=farm, name="Winter Wheat Field",
            defaults=dict(zone=pasture, domain_type=LivingInventoryItem.DomainType.CROP,
                          species_or_variety="Wheat", quantity=1, health_status="HEALTHY"),
        )
        if created:
            CropDetail.objects.create(item=wheat, planting_date=date.today() - timedelta(days=30), growth_stage="Vegetative")

        feed, created = Supply.objects.get_or_create(
            farm=farm, name="Poultry Feed Bag",
            defaults=dict(storage_zone=storage, category=Supply.Category.ANIMAL_FEED,
                          current_stock=Decimal("30.00"), total_capacity=Decimal("200.00"),
                          unit=Supply.Unit.KG, reorder_threshold_days=10),
        )
        if created:
            SupplyConsumptionGroup.objects.create(supply=feed, inventory_item=hens, daily_amount_per_unit=Decimal("0.15"))
            for days_ago in range(6):
                log = ConsumptionLogEntry.objects.create(supply=feed, actual_quantity=Decimal("5.00"), adjustment_type="TASK_COMPLETION", logged_by=farmhand)
                ConsumptionLogEntry.objects.filter(id=log.id).update(created_at=djtz.now() - timedelta(days=days_ago))

        Supply.objects.get_or_create(
            farm=farm, name="Premium Alfalfa Hay",
            defaults=dict(storage_zone=storage, category=Supply.Category.ANIMAL_FEED,
                          current_stock=Decimal("450.00"), total_capacity=Decimal("600.00"),
                          unit=Supply.Unit.KG, batch_number="2024-ALF-09"),
        )

        water_sched, _ = Schedule.objects.get_or_create(
            farm=farm, title="Water South Pasture",
            defaults=dict(schedule_type=Schedule.ScheduleType.RECURRING,
                          recurrence_frequency=Schedule.RecurrenceFrequency.DAILY, recurrence_interval=1,
                          start_date=date.today() - timedelta(days=3), linked_zone=pasture,
                          urgency=Schedule.Urgency.URGENT, assigned_to=farmhand, created_by=owner,
                          alarm_enabled=True, alarm_time="07:00"),
        )
        feed_sched, _ = Schedule.objects.get_or_create(
            farm=farm, title="Feed Poultry",
            defaults=dict(schedule_type=Schedule.ScheduleType.RECURRING,
                          recurrence_frequency=Schedule.RecurrenceFrequency.DAILY, recurrence_interval=1,
                          start_date=date.today() - timedelta(days=3), linked_inventory_item=hens,
                          linked_supply=feed, expected_quantity=Decimal("5.00"),
                          urgency=Schedule.Urgency.ROUTINE, assigned_to=farmhand, created_by=owner),
        )
        health_sched, _ = Schedule.objects.get_or_create(
            farm=farm, title="Livestock Health Audit",
            defaults=dict(schedule_type=Schedule.ScheduleType.RECURRING,
                          recurrence_frequency=Schedule.RecurrenceFrequency.WEEKLY, recurrence_interval=1,
                          recurrence_days_of_week=[0], start_date=date.today() - timedelta(days=3),
                          linked_inventory_item=cows, urgency=Schedule.Urgency.ROUTINE, created_by=owner),
        )

        for sched in [water_sched, feed_sched, health_sched]:
            sched.generate_occurrences(until_date=date.today() + timedelta(days=10))
            past_occ = sched.occurrences.filter(due_date=date.today() - timedelta(days=1), status="PENDING").first()
            if past_occ:
                past_occ.mark_complete(completed_by=farmhand, actual_quantity=sched.expected_quantity)

        AuditLogEntry.record(farm=farm, actor=owner, action="CREATE", category="MANAGEMENT", target=cows, description="Added Holstein Cows to living inventory")
        AuditLogEntry.record(farm=farm, actor=farmhand, action="COMPLETE", category="SCHEDULE", target=water_sched, description="Completed South Pasture watering")

        self.stdout.write(self.style.SUCCESS(f"Seeded demo farm: {farm.name} ({farm.id})"))
        self.stdout.write("Owner:    owner@farmloop.demo (Google, uid=demo-owner-uid)")
        self.stdout.write("Farmhand: sam@farmloop.demo (Google, uid=demo-sam-uid)")

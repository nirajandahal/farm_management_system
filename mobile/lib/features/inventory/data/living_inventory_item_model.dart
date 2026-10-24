import 'package:freezed_annotation/freezed_annotation.dart';

part 'living_inventory_item_model.freezed.dart';
part 'living_inventory_item_model.g.dart';

enum DomainType {
  @JsonValue('ANIMAL')
  animal,
  @JsonValue('CROP')
  crop,
  @JsonValue('FISH')
  fish,
  @JsonValue('FUNGI')
  fungi,
}

enum HealthStatus {
  @JsonValue('HEALTHY')
  healthy,
  @JsonValue('MONITORING')
  monitoring,
  @JsonValue('CRITICAL')
  critical,
}

/// Mirrors apps/inventory/serializers.py LivingInventoryItemSerializer.
/// `detail` is polymorphic on the backend (a different shape per
/// domain_type) -- kept as a raw map here rather than a sealed union, with
/// typed getters below for the fields each screen actually needs. A full
/// sealed-class-per-domain model would need a second discriminator dispatch
/// on top of the one the backend already does; not worth the duplication
/// for a read-mostly detail payload.
@freezed
abstract class LivingInventoryItemModel with _$LivingInventoryItemModel {
  const LivingInventoryItemModel._();

  const factory LivingInventoryItemModel({
    required String id,
    required String farm,
    String? zone,
    @JsonKey(name: 'domain_type') required DomainType domainType,
    required String name,
    @JsonKey(name: 'species_or_variety') String? speciesOrVariety,
    required int quantity,
    @JsonKey(name: 'health_status') required HealthStatus healthStatus,
    @JsonKey(name: 'reference_photo') String? referencePhoto,
    @JsonKey(name: 'is_archived') @Default(false) bool isArchived,
    Map<String, dynamic>? detail,
  }) = _LivingInventoryItemModel;

  factory LivingInventoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$LivingInventoryItemModelFromJson(json);

  // Animal
  String? get breed => detail?['breed'] as String?;
  String? get avgWeight => detail?['avg_weight'] as String?;
  String? get breedingStatus => detail?['breeding_status'] as String?;

  // Crop
  String? get growthStage => detail?['growth_stage'] as String?;
  String? get plantingDate => detail?['planting_date'] as String?;
  String? get expectedHarvestDate => detail?['expected_harvest_date'] as String?;

  // Fish
  String? get targetWaterTemp => detail?['target_water_temp'] as String?;
  String? get targetPh => detail?['target_ph'] as String?;

  // Fungi
  String? get substrateType => detail?['substrate_type'] as String?;
  String? get targetHumidity => detail?['target_humidity'] as String?;
}

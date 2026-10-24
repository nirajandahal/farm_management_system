// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'living_inventory_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LivingInventoryItemModel _$LivingInventoryItemModelFromJson(
  Map<String, dynamic> json,
) => _LivingInventoryItemModel(
  id: json['id'] as String,
  farm: json['farm'] as String,
  zone: json['zone'] as String?,
  domainType: $enumDecode(_$DomainTypeEnumMap, json['domain_type']),
  name: json['name'] as String,
  speciesOrVariety: json['species_or_variety'] as String?,
  quantity: (json['quantity'] as num).toInt(),
  healthStatus: $enumDecode(_$HealthStatusEnumMap, json['health_status']),
  referencePhoto: json['reference_photo'] as String?,
  isArchived: json['is_archived'] as bool? ?? false,
  detail: json['detail'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$LivingInventoryItemModelToJson(
  _LivingInventoryItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'farm': instance.farm,
  'zone': instance.zone,
  'domain_type': _$DomainTypeEnumMap[instance.domainType]!,
  'name': instance.name,
  'species_or_variety': instance.speciesOrVariety,
  'quantity': instance.quantity,
  'health_status': _$HealthStatusEnumMap[instance.healthStatus]!,
  'reference_photo': instance.referencePhoto,
  'is_archived': instance.isArchived,
  'detail': instance.detail,
};

const _$DomainTypeEnumMap = {
  DomainType.animal: 'ANIMAL',
  DomainType.crop: 'CROP',
  DomainType.fish: 'FISH',
  DomainType.fungi: 'FUNGI',
};

const _$HealthStatusEnumMap = {
  HealthStatus.healthy: 'HEALTHY',
  HealthStatus.monitoring: 'MONITORING',
  HealthStatus.critical: 'CRITICAL',
};

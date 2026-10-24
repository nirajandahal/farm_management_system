// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupplyModel _$SupplyModelFromJson(Map<String, dynamic> json) => _SupplyModel(
  id: json['id'] as String,
  farm: json['farm'] as String,
  storageZone: json['storage_zone'] as String?,
  name: json['name'] as String,
  category: $enumDecode(_$SupplyCategoryEnumMap, json['category']),
  photo: json['photo'] as String?,
  currentStock: json['current_stock'] as String,
  totalCapacity: json['total_capacity'] as String?,
  unit: $enumDecode(_$SupplyUnitEnumMap, json['unit']),
  batchNumber: json['batch_number'] as String?,
  expiryDate: json['expiry_date'] as String?,
  reorderThresholdDays: (json['reorder_threshold_days'] as num?)?.toInt(),
  isArchived: json['is_archived'] as bool? ?? false,
);

Map<String, dynamic> _$SupplyModelToJson(_SupplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'farm': instance.farm,
      'storage_zone': instance.storageZone,
      'name': instance.name,
      'category': _$SupplyCategoryEnumMap[instance.category]!,
      'photo': instance.photo,
      'current_stock': instance.currentStock,
      'total_capacity': instance.totalCapacity,
      'unit': _$SupplyUnitEnumMap[instance.unit]!,
      'batch_number': instance.batchNumber,
      'expiry_date': instance.expiryDate,
      'reorder_threshold_days': instance.reorderThresholdDays,
      'is_archived': instance.isArchived,
    };

const _$SupplyCategoryEnumMap = {
  SupplyCategory.animalFeed: 'ANIMAL_FEED',
  SupplyCategory.fertilizer: 'FERTILIZER',
  SupplyCategory.medicine: 'MEDICINE',
  SupplyCategory.seed: 'SEED',
  SupplyCategory.other: 'OTHER',
};

const _$SupplyUnitEnumMap = {
  SupplyUnit.kg: 'KG',
  SupplyUnit.liters: 'LITERS',
  SupplyUnit.packets: 'PACKETS',
  SupplyUnit.units: 'UNITS',
  SupplyUnit.other: 'OTHER',
};

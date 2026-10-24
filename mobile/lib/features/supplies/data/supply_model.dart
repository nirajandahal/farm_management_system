import 'package:freezed_annotation/freezed_annotation.dart';

part 'supply_model.freezed.dart';
part 'supply_model.g.dart';

enum SupplyCategory {
  @JsonValue('ANIMAL_FEED')
  animalFeed,
  @JsonValue('FERTILIZER')
  fertilizer,
  @JsonValue('MEDICINE')
  medicine,
  @JsonValue('SEED')
  seed,
  @JsonValue('OTHER')
  other,
}

enum SupplyUnit {
  @JsonValue('KG')
  kg,
  @JsonValue('LITERS')
  liters,
  @JsonValue('PACKETS')
  packets,
  @JsonValue('UNITS')
  units,
  @JsonValue('OTHER')
  other,
}

/// Mirrors apps/supplies/serializers.py SupplySerializer.
@freezed
abstract class SupplyModel with _$SupplyModel {
  const SupplyModel._();

  const factory SupplyModel({
    required String id,
    required String farm,
    @JsonKey(name: 'storage_zone') String? storageZone,
    required String name,
    required SupplyCategory category,
    String? photo,
    @JsonKey(name: 'current_stock') required String currentStock,
    @JsonKey(name: 'total_capacity') String? totalCapacity,
    required SupplyUnit unit,
    @JsonKey(name: 'batch_number') String? batchNumber,
    @JsonKey(name: 'expiry_date') String? expiryDate,
    @JsonKey(name: 'reorder_threshold_days') int? reorderThresholdDays,
    @JsonKey(name: 'is_archived') @Default(false) bool isArchived,
  }) = _SupplyModel;

  factory SupplyModel.fromJson(Map<String, dynamic> json) => _$SupplyModelFromJson(json);

  /// Null when total_capacity isn't set -- there's nothing to show a
  /// percentage bar against.
  double? get stockFraction {
    final capacity = double.tryParse(totalCapacity ?? '');
    final stock = double.tryParse(currentStock);
    if (capacity == null || capacity <= 0 || stock == null) return null;
    return (stock / capacity).clamp(0.0, 1.0);
  }
}

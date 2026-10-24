import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_entry_models.freezed.dart';
part 'log_entry_models.g.dart';

enum HealthSeverity {
  @JsonValue('CRITICAL')
  critical,
  @JsonValue('MODERATE')
  moderate,
  @JsonValue('ROUTINE')
  routine,
}

/// Mirrors apps/inventory/serializers.py HealthLogEntrySerializer.
@freezed
abstract class HealthLogEntryModel with _$HealthLogEntryModel {
  const factory HealthLogEntryModel({
    required String id,
    required HealthSeverity severity,
    @JsonKey(name: 'issue_description') String? issueDescription,
    @JsonKey(name: 'treatment_required') String? treatmentRequired,
    @JsonKey(name: 'doctor_name') String? doctorName,
    String? note,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _HealthLogEntryModel;

  factory HealthLogEntryModel.fromJson(Map<String, dynamic> json) =>
      _$HealthLogEntryModelFromJson(json);
}

/// Mirrors apps/inventory/serializers.py ProductionLogEntrySerializer.
@freezed
abstract class ProductionLogEntryModel with _$ProductionLogEntryModel {
  const factory ProductionLogEntryModel({
    required String id,
    @JsonKey(name: 'individual_id_tag') String? individualIdTag,
    @JsonKey(name: 'metric_type') required String metricType,
    required String value,
    required String unit,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _ProductionLogEntryModel;

  factory ProductionLogEntryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionLogEntryModelFromJson(json);
}

/// Mirrors apps/inventory/serializers.py BreedingLogEntrySerializer.
@freezed
abstract class BreedingLogEntryModel with _$BreedingLogEntryModel {
  const factory BreedingLogEntryModel({
    required String id,
    @JsonKey(name: 'individual_id_tag') String? individualIdTag,
    @JsonKey(name: 'last_mating_date') String? lastMatingDate,
    @JsonKey(name: 'breeding_status') required String breedingStatus,
    @JsonKey(name: 'expected_delivery_date') String? expectedDeliveryDate,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _BreedingLogEntryModel;

  factory BreedingLogEntryModel.fromJson(Map<String, dynamic> json) =>
      _$BreedingLogEntryModelFromJson(json);
}

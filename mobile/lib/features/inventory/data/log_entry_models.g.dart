// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_entry_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HealthLogEntryModel _$HealthLogEntryModelFromJson(Map<String, dynamic> json) =>
    _HealthLogEntryModel(
      id: json['id'] as String,
      severity: $enumDecode(_$HealthSeverityEnumMap, json['severity']),
      issueDescription: json['issue_description'] as String?,
      treatmentRequired: json['treatment_required'] as String?,
      doctorName: json['doctor_name'] as String?,
      note: json['note'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$HealthLogEntryModelToJson(
  _HealthLogEntryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'severity': _$HealthSeverityEnumMap[instance.severity]!,
  'issue_description': instance.issueDescription,
  'treatment_required': instance.treatmentRequired,
  'doctor_name': instance.doctorName,
  'note': instance.note,
  'created_at': instance.createdAt,
};

const _$HealthSeverityEnumMap = {
  HealthSeverity.critical: 'CRITICAL',
  HealthSeverity.moderate: 'MODERATE',
  HealthSeverity.routine: 'ROUTINE',
};

_ProductionLogEntryModel _$ProductionLogEntryModelFromJson(
  Map<String, dynamic> json,
) => _ProductionLogEntryModel(
  id: json['id'] as String,
  individualIdTag: json['individual_id_tag'] as String?,
  metricType: json['metric_type'] as String,
  value: json['value'] as String,
  unit: json['unit'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$ProductionLogEntryModelToJson(
  _ProductionLogEntryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'individual_id_tag': instance.individualIdTag,
  'metric_type': instance.metricType,
  'value': instance.value,
  'unit': instance.unit,
  'created_at': instance.createdAt,
};

_BreedingLogEntryModel _$BreedingLogEntryModelFromJson(
  Map<String, dynamic> json,
) => _BreedingLogEntryModel(
  id: json['id'] as String,
  individualIdTag: json['individual_id_tag'] as String?,
  lastMatingDate: json['last_mating_date'] as String?,
  breedingStatus: json['breeding_status'] as String,
  expectedDeliveryDate: json['expected_delivery_date'] as String?,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$BreedingLogEntryModelToJson(
  _BreedingLogEntryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'individual_id_tag': instance.individualIdTag,
  'last_mating_date': instance.lastMatingDate,
  'breeding_status': instance.breedingStatus,
  'expected_delivery_date': instance.expectedDeliveryDate,
  'created_at': instance.createdAt,
};

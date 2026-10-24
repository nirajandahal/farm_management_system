// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occurrence_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OccurrenceModel _$OccurrenceModelFromJson(Map<String, dynamic> json) =>
    _OccurrenceModel(
      id: json['id'] as String,
      schedule: json['schedule'] as String,
      title: json['title'] as String,
      dueDate: json['due_date'] as String,
      dueTime: json['due_time'] as String?,
      status: $enumDecode(_$OccurrenceStatusEnumMap, json['status']),
      completedAt: json['completed_at'] as String?,
      completedBy: json['completed_by'] as String?,
      actualQuantity: json['actual_quantity'] as String?,
      skipReason: json['skip_reason'] as String?,
      note: json['note'] as String?,
      geotagLat: (json['geotag_lat'] as num?)?.toDouble(),
      geotagLng: (json['geotag_lng'] as num?)?.toDouble(),
      urgency:
          $enumDecodeNullable(_$ScheduleUrgencyEnumMap, json['urgency']) ??
          ScheduleUrgency.routine,
    );

Map<String, dynamic> _$OccurrenceModelToJson(_OccurrenceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schedule': instance.schedule,
      'title': instance.title,
      'due_date': instance.dueDate,
      'due_time': instance.dueTime,
      'status': _$OccurrenceStatusEnumMap[instance.status]!,
      'completed_at': instance.completedAt,
      'completed_by': instance.completedBy,
      'actual_quantity': instance.actualQuantity,
      'skip_reason': instance.skipReason,
      'note': instance.note,
      'geotag_lat': instance.geotagLat,
      'geotag_lng': instance.geotagLng,
      'urgency': _$ScheduleUrgencyEnumMap[instance.urgency]!,
    };

const _$OccurrenceStatusEnumMap = {
  OccurrenceStatus.pending: 'PENDING',
  OccurrenceStatus.completed: 'COMPLETED',
  OccurrenceStatus.skipped: 'SKIPPED',
  OccurrenceStatus.overdue: 'OVERDUE',
  OccurrenceStatus.missed: 'MISSED',
};

const _$ScheduleUrgencyEnumMap = {
  ScheduleUrgency.urgent: 'URGENT',
  ScheduleUrgency.routine: 'ROUTINE',
  ScheduleUrgency.admin: 'ADMIN',
};

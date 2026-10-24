import 'package:freezed_annotation/freezed_annotation.dart';

part 'occurrence_model.freezed.dart';
part 'occurrence_model.g.dart';

enum OccurrenceStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('SKIPPED')
  skipped,
  @JsonValue('OVERDUE')
  overdue,
  @JsonValue('MISSED')
  missed,
}

enum ScheduleUrgency {
  @JsonValue('URGENT')
  urgent,
  @JsonValue('ROUTINE')
  routine,
  @JsonValue('ADMIN')
  admin,
}

/// Mirrors apps/schedules/serializers.py OccurrenceSerializer. `urgency`
/// isn't actually on the backend's Occurrence model (it lives on the
/// parent Schedule) -- see the note on OccurrenceApiService.fetchToday.
@freezed
abstract class OccurrenceModel with _$OccurrenceModel {
  const factory OccurrenceModel({
    required String id,
    required String schedule,
    required String title,
    @JsonKey(name: 'due_date') required String dueDate,
    @JsonKey(name: 'due_time') String? dueTime,
    required OccurrenceStatus status,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'completed_by') String? completedBy,
    @JsonKey(name: 'actual_quantity') String? actualQuantity,
    @JsonKey(name: 'skip_reason') String? skipReason,
    String? note,
    @JsonKey(name: 'geotag_lat') double? geotagLat,
    @JsonKey(name: 'geotag_lng') double? geotagLng,
    @Default(ScheduleUrgency.routine) ScheduleUrgency urgency,
  }) = _OccurrenceModel;

  factory OccurrenceModel.fromJson(Map<String, dynamic> json) =>
      _$OccurrenceModelFromJson(json);
}

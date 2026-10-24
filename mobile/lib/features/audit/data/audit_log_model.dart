import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_log_model.freezed.dart';
part 'audit_log_model.g.dart';

/// Mirrors apps/audit/serializers.py AuditLogEntrySerializer. `actor` is
/// just a user ID on the backend (not expanded to a name) -- the Team tab
/// already fetches the full member list, so the UI cross-references actor
/// IDs against that rather than requiring a backend change.
@freezed
abstract class AuditLogModel with _$AuditLogModel {
  const factory AuditLogModel({
    required String id,
    String? actor,
    required String action,
    required String category,
    @JsonKey(name: 'target_model') required String targetModel,
    @JsonKey(name: 'target_display_name') required String targetDisplayName,
    @JsonKey(name: 'reference_id') String? referenceId,
    String? description,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _AuditLogModel;

  factory AuditLogModel.fromJson(Map<String, dynamic> json) => _$AuditLogModelFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditLogModel _$AuditLogModelFromJson(Map<String, dynamic> json) =>
    _AuditLogModel(
      id: json['id'] as String,
      actor: json['actor'] as String?,
      action: json['action'] as String,
      category: json['category'] as String,
      targetModel: json['target_model'] as String,
      targetDisplayName: json['target_display_name'] as String,
      referenceId: json['reference_id'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$AuditLogModelToJson(_AuditLogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actor': instance.actor,
      'action': instance.action,
      'category': instance.category,
      'target_model': instance.targetModel,
      'target_display_name': instance.targetDisplayName,
      'reference_id': instance.referenceId,
      'description': instance.description,
      'created_at': instance.createdAt,
    };

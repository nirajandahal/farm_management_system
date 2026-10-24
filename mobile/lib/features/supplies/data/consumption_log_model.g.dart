// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsumptionLogModel _$ConsumptionLogModelFromJson(Map<String, dynamic> json) =>
    _ConsumptionLogModel(
      id: json['id'] as String,
      expectedQuantity: json['expected_quantity'] as String?,
      actualQuantity: json['actual_quantity'] as String,
      adjustmentType: $enumDecode(
        _$AdjustmentTypeEnumMap,
        json['adjustment_type'],
      ),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$ConsumptionLogModelToJson(
  _ConsumptionLogModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'expected_quantity': instance.expectedQuantity,
  'actual_quantity': instance.actualQuantity,
  'adjustment_type': _$AdjustmentTypeEnumMap[instance.adjustmentType]!,
  'created_at': instance.createdAt,
};

const _$AdjustmentTypeEnumMap = {
  AdjustmentType.taskCompletion: 'TASK_COMPLETION',
  AdjustmentType.manualUpdate: 'MANUAL_UPDATE',
  AdjustmentType.restock: 'RESTOCK',
};

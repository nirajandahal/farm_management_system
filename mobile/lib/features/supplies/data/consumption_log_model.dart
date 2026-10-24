import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumption_log_model.freezed.dart';
part 'consumption_log_model.g.dart';

enum AdjustmentType {
  @JsonValue('TASK_COMPLETION')
  taskCompletion,
  @JsonValue('MANUAL_UPDATE')
  manualUpdate,
  @JsonValue('RESTOCK')
  restock,
}

/// Mirrors apps/supplies/serializers.py ConsumptionLogEntrySerializer.
@freezed
abstract class ConsumptionLogModel with _$ConsumptionLogModel {
  const factory ConsumptionLogModel({
    required String id,
    @JsonKey(name: 'expected_quantity') String? expectedQuantity,
    @JsonKey(name: 'actual_quantity') required String actualQuantity,
    @JsonKey(name: 'adjustment_type') required AdjustmentType adjustmentType,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _ConsumptionLogModel;

  factory ConsumptionLogModel.fromJson(Map<String, dynamic> json) =>
      _$ConsumptionLogModelFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupplyForecastModel _$SupplyForecastModelFromJson(Map<String, dynamic> json) =>
    _SupplyForecastModel(
      dailyUsageRate: json['daily_usage_rate'] as String?,
      predictedEmptyDate: json['predicted_empty_date'] as String?,
      lastComputedAt: json['last_computed_at'] as String?,
    );

Map<String, dynamic> _$SupplyForecastModelToJson(
  _SupplyForecastModel instance,
) => <String, dynamic>{
  'daily_usage_rate': instance.dailyUsageRate,
  'predicted_empty_date': instance.predictedEmptyDate,
  'last_computed_at': instance.lastComputedAt,
};

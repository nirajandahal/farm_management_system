import 'package:freezed_annotation/freezed_annotation.dart';

part 'supply_forecast_model.freezed.dart';
part 'supply_forecast_model.g.dart';

/// Mirrors apps/supplies/serializers.py SupplyForecastSerializer.
@freezed
abstract class SupplyForecastModel with _$SupplyForecastModel {
  const factory SupplyForecastModel({
    @JsonKey(name: 'daily_usage_rate') String? dailyUsageRate,
    @JsonKey(name: 'predicted_empty_date') String? predictedEmptyDate,
    @JsonKey(name: 'last_computed_at') String? lastComputedAt,
  }) = _SupplyForecastModel;

  factory SupplyForecastModel.fromJson(Map<String, dynamic> json) =>
      _$SupplyForecastModelFromJson(json);
}

/// The forecast endpoint has three real outcomes, not one -- collapsing
/// them into a single thrown exception would make the detail screen unable
/// to tell "not on your plan" (403, upsell) apart from "no data yet" (404,
/// keep logging usage) or a genuine failure.
sealed class ForecastResult {
  const ForecastResult();
}

class ForecastAvailable extends ForecastResult {
  const ForecastAvailable(this.forecast);
  final SupplyForecastModel forecast;
}

class ForecastNotComputed extends ForecastResult {
  const ForecastNotComputed();
}

class ForecastNotAllowed extends ForecastResult {
  const ForecastNotAllowed();
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supply_forecast_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupplyForecastModel {

@JsonKey(name: 'daily_usage_rate') String? get dailyUsageRate;@JsonKey(name: 'predicted_empty_date') String? get predictedEmptyDate;@JsonKey(name: 'last_computed_at') String? get lastComputedAt;
/// Create a copy of SupplyForecastModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplyForecastModelCopyWith<SupplyForecastModel> get copyWith => _$SupplyForecastModelCopyWithImpl<SupplyForecastModel>(this as SupplyForecastModel, _$identity);

  /// Serializes this SupplyForecastModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SupplyForecastModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplyForecastModel&&(identical(other.dailyUsageRate, _this.dailyUsageRate) || other.dailyUsageRate == _this.dailyUsageRate)&&(identical(other.predictedEmptyDate, _this.predictedEmptyDate) || other.predictedEmptyDate == _this.predictedEmptyDate)&&(identical(other.lastComputedAt, _this.lastComputedAt) || other.lastComputedAt == _this.lastComputedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SupplyForecastModel;
  return Object.hash(runtimeType,_this.dailyUsageRate,_this.predictedEmptyDate,_this.lastComputedAt);
}

@override
String toString() {
  final _this = this as SupplyForecastModel;
  return 'SupplyForecastModel(dailyUsageRate: ${_this.dailyUsageRate}, predictedEmptyDate: ${_this.predictedEmptyDate}, lastComputedAt: ${_this.lastComputedAt})';
}


}

/// @nodoc
abstract mixin class $SupplyForecastModelCopyWith<$Res>  {
  factory $SupplyForecastModelCopyWith(SupplyForecastModel value, $Res Function(SupplyForecastModel) _then) = _$SupplyForecastModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'daily_usage_rate') String? dailyUsageRate,@JsonKey(name: 'predicted_empty_date') String? predictedEmptyDate,@JsonKey(name: 'last_computed_at') String? lastComputedAt
});




}
/// @nodoc
class _$SupplyForecastModelCopyWithImpl<$Res>
    implements $SupplyForecastModelCopyWith<$Res> {
  _$SupplyForecastModelCopyWithImpl(this._self, this._then);

  final SupplyForecastModel _self;
  final $Res Function(SupplyForecastModel) _then;

/// Create a copy of SupplyForecastModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dailyUsageRate = freezed,Object? predictedEmptyDate = freezed,Object? lastComputedAt = freezed,}) {
  return _then(SupplyForecastModel(
dailyUsageRate: freezed == dailyUsageRate ? _self.dailyUsageRate : dailyUsageRate // ignore: cast_nullable_to_non_nullable
as String?,predictedEmptyDate: freezed == predictedEmptyDate ? _self.predictedEmptyDate : predictedEmptyDate // ignore: cast_nullable_to_non_nullable
as String?,lastComputedAt: freezed == lastComputedAt ? _self.lastComputedAt : lastComputedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplyForecastModel].
extension SupplyForecastModelPatterns on SupplyForecastModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplyForecastModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplyForecastModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplyForecastModel value)  $default,){
final _that = this;
switch (_that) {
case _SupplyForecastModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplyForecastModel value)?  $default,){
final _that = this;
switch (_that) {
case _SupplyForecastModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'daily_usage_rate')  String? dailyUsageRate, @JsonKey(name: 'predicted_empty_date')  String? predictedEmptyDate, @JsonKey(name: 'last_computed_at')  String? lastComputedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplyForecastModel() when $default != null:
return $default(_that.dailyUsageRate,_that.predictedEmptyDate,_that.lastComputedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'daily_usage_rate')  String? dailyUsageRate, @JsonKey(name: 'predicted_empty_date')  String? predictedEmptyDate, @JsonKey(name: 'last_computed_at')  String? lastComputedAt)  $default,) {final _that = this;
switch (_that) {
case _SupplyForecastModel():
return $default(_that.dailyUsageRate,_that.predictedEmptyDate,_that.lastComputedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'daily_usage_rate')  String? dailyUsageRate, @JsonKey(name: 'predicted_empty_date')  String? predictedEmptyDate, @JsonKey(name: 'last_computed_at')  String? lastComputedAt)?  $default,) {final _that = this;
switch (_that) {
case _SupplyForecastModel() when $default != null:
return $default(_that.dailyUsageRate,_that.predictedEmptyDate,_that.lastComputedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupplyForecastModel implements SupplyForecastModel {
  const _SupplyForecastModel({@JsonKey(name: 'daily_usage_rate') this.dailyUsageRate, @JsonKey(name: 'predicted_empty_date') this.predictedEmptyDate, @JsonKey(name: 'last_computed_at') this.lastComputedAt});
  factory _SupplyForecastModel.fromJson(Map<String, dynamic> json) => _$SupplyForecastModelFromJson(json);

@override@JsonKey(name: 'daily_usage_rate') final  String? dailyUsageRate;
@override@JsonKey(name: 'predicted_empty_date') final  String? predictedEmptyDate;
@override@JsonKey(name: 'last_computed_at') final  String? lastComputedAt;

/// Create a copy of SupplyForecastModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplyForecastModelCopyWith<_SupplyForecastModel> get copyWith => __$SupplyForecastModelCopyWithImpl<_SupplyForecastModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupplyForecastModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplyForecastModel&&(identical(other.dailyUsageRate, dailyUsageRate) || other.dailyUsageRate == dailyUsageRate)&&(identical(other.predictedEmptyDate, predictedEmptyDate) || other.predictedEmptyDate == predictedEmptyDate)&&(identical(other.lastComputedAt, lastComputedAt) || other.lastComputedAt == lastComputedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,dailyUsageRate,predictedEmptyDate,lastComputedAt);
}

@override
String toString() {
    return 'SupplyForecastModel(dailyUsageRate: $dailyUsageRate, predictedEmptyDate: $predictedEmptyDate, lastComputedAt: $lastComputedAt)';
}


}

/// @nodoc
abstract mixin class _$SupplyForecastModelCopyWith<$Res> implements $SupplyForecastModelCopyWith<$Res> {
  factory _$SupplyForecastModelCopyWith(_SupplyForecastModel value, $Res Function(_SupplyForecastModel) _then) = __$SupplyForecastModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'daily_usage_rate') String? dailyUsageRate,@JsonKey(name: 'predicted_empty_date') String? predictedEmptyDate,@JsonKey(name: 'last_computed_at') String? lastComputedAt
});




}
/// @nodoc
class __$SupplyForecastModelCopyWithImpl<$Res>
    implements _$SupplyForecastModelCopyWith<$Res> {
  __$SupplyForecastModelCopyWithImpl(this._self, this._then);

  final _SupplyForecastModel _self;
  final $Res Function(_SupplyForecastModel) _then;

/// Create a copy of SupplyForecastModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dailyUsageRate = freezed,Object? predictedEmptyDate = freezed,Object? lastComputedAt = freezed,}) {
  return _then(_SupplyForecastModel(
dailyUsageRate: freezed == dailyUsageRate ? _self.dailyUsageRate : dailyUsageRate // ignore: cast_nullable_to_non_nullable
as String?,predictedEmptyDate: freezed == predictedEmptyDate ? _self.predictedEmptyDate : predictedEmptyDate // ignore: cast_nullable_to_non_nullable
as String?,lastComputedAt: freezed == lastComputedAt ? _self.lastComputedAt : lastComputedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

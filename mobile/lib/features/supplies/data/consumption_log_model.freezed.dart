// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumption_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsumptionLogModel {

 String get id;@JsonKey(name: 'expected_quantity') String? get expectedQuantity;@JsonKey(name: 'actual_quantity') String get actualQuantity;@JsonKey(name: 'adjustment_type') AdjustmentType get adjustmentType;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of ConsumptionLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsumptionLogModelCopyWith<ConsumptionLogModel> get copyWith => _$ConsumptionLogModelCopyWithImpl<ConsumptionLogModel>(this as ConsumptionLogModel, _$identity);

  /// Serializes this ConsumptionLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ConsumptionLogModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsumptionLogModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.expectedQuantity, _this.expectedQuantity) || other.expectedQuantity == _this.expectedQuantity)&&(identical(other.actualQuantity, _this.actualQuantity) || other.actualQuantity == _this.actualQuantity)&&(identical(other.adjustmentType, _this.adjustmentType) || other.adjustmentType == _this.adjustmentType)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ConsumptionLogModel;
  return Object.hash(runtimeType,_this.id,_this.expectedQuantity,_this.actualQuantity,_this.adjustmentType,_this.createdAt);
}

@override
String toString() {
  final _this = this as ConsumptionLogModel;
  return 'ConsumptionLogModel(id: ${_this.id}, expectedQuantity: ${_this.expectedQuantity}, actualQuantity: ${_this.actualQuantity}, adjustmentType: ${_this.adjustmentType}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ConsumptionLogModelCopyWith<$Res>  {
  factory $ConsumptionLogModelCopyWith(ConsumptionLogModel value, $Res Function(ConsumptionLogModel) _then) = _$ConsumptionLogModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'expected_quantity') String? expectedQuantity,@JsonKey(name: 'actual_quantity') String actualQuantity,@JsonKey(name: 'adjustment_type') AdjustmentType adjustmentType,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$ConsumptionLogModelCopyWithImpl<$Res>
    implements $ConsumptionLogModelCopyWith<$Res> {
  _$ConsumptionLogModelCopyWithImpl(this._self, this._then);

  final ConsumptionLogModel _self;
  final $Res Function(ConsumptionLogModel) _then;

/// Create a copy of ConsumptionLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? expectedQuantity = freezed,Object? actualQuantity = null,Object? adjustmentType = null,Object? createdAt = null,}) {
  return _then(ConsumptionLogModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expectedQuantity: freezed == expectedQuantity ? _self.expectedQuantity : expectedQuantity // ignore: cast_nullable_to_non_nullable
as String?,actualQuantity: null == actualQuantity ? _self.actualQuantity : actualQuantity // ignore: cast_nullable_to_non_nullable
as String,adjustmentType: null == adjustmentType ? _self.adjustmentType : adjustmentType // ignore: cast_nullable_to_non_nullable
as AdjustmentType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsumptionLogModel].
extension ConsumptionLogModelPatterns on ConsumptionLogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsumptionLogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsumptionLogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsumptionLogModel value)  $default,){
final _that = this;
switch (_that) {
case _ConsumptionLogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsumptionLogModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConsumptionLogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'expected_quantity')  String? expectedQuantity, @JsonKey(name: 'actual_quantity')  String actualQuantity, @JsonKey(name: 'adjustment_type')  AdjustmentType adjustmentType, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsumptionLogModel() when $default != null:
return $default(_that.id,_that.expectedQuantity,_that.actualQuantity,_that.adjustmentType,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'expected_quantity')  String? expectedQuantity, @JsonKey(name: 'actual_quantity')  String actualQuantity, @JsonKey(name: 'adjustment_type')  AdjustmentType adjustmentType, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _ConsumptionLogModel():
return $default(_that.id,_that.expectedQuantity,_that.actualQuantity,_that.adjustmentType,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'expected_quantity')  String? expectedQuantity, @JsonKey(name: 'actual_quantity')  String actualQuantity, @JsonKey(name: 'adjustment_type')  AdjustmentType adjustmentType, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ConsumptionLogModel() when $default != null:
return $default(_that.id,_that.expectedQuantity,_that.actualQuantity,_that.adjustmentType,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsumptionLogModel implements ConsumptionLogModel {
  const _ConsumptionLogModel({required this.id, @JsonKey(name: 'expected_quantity') this.expectedQuantity, @JsonKey(name: 'actual_quantity') required this.actualQuantity, @JsonKey(name: 'adjustment_type') required this.adjustmentType, @JsonKey(name: 'created_at') required this.createdAt});
  factory _ConsumptionLogModel.fromJson(Map<String, dynamic> json) => _$ConsumptionLogModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'expected_quantity') final  String? expectedQuantity;
@override@JsonKey(name: 'actual_quantity') final  String actualQuantity;
@override@JsonKey(name: 'adjustment_type') final  AdjustmentType adjustmentType;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of ConsumptionLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsumptionLogModelCopyWith<_ConsumptionLogModel> get copyWith => __$ConsumptionLogModelCopyWithImpl<_ConsumptionLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsumptionLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsumptionLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.expectedQuantity, expectedQuantity) || other.expectedQuantity == expectedQuantity)&&(identical(other.actualQuantity, actualQuantity) || other.actualQuantity == actualQuantity)&&(identical(other.adjustmentType, adjustmentType) || other.adjustmentType == adjustmentType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,expectedQuantity,actualQuantity,adjustmentType,createdAt);
}

@override
String toString() {
    return 'ConsumptionLogModel(id: $id, expectedQuantity: $expectedQuantity, actualQuantity: $actualQuantity, adjustmentType: $adjustmentType, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ConsumptionLogModelCopyWith<$Res> implements $ConsumptionLogModelCopyWith<$Res> {
  factory _$ConsumptionLogModelCopyWith(_ConsumptionLogModel value, $Res Function(_ConsumptionLogModel) _then) = __$ConsumptionLogModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'expected_quantity') String? expectedQuantity,@JsonKey(name: 'actual_quantity') String actualQuantity,@JsonKey(name: 'adjustment_type') AdjustmentType adjustmentType,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$ConsumptionLogModelCopyWithImpl<$Res>
    implements _$ConsumptionLogModelCopyWith<$Res> {
  __$ConsumptionLogModelCopyWithImpl(this._self, this._then);

  final _ConsumptionLogModel _self;
  final $Res Function(_ConsumptionLogModel) _then;

/// Create a copy of ConsumptionLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expectedQuantity = freezed,Object? actualQuantity = null,Object? adjustmentType = null,Object? createdAt = null,}) {
  return _then(_ConsumptionLogModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expectedQuantity: freezed == expectedQuantity ? _self.expectedQuantity : expectedQuantity // ignore: cast_nullable_to_non_nullable
as String?,actualQuantity: null == actualQuantity ? _self.actualQuantity : actualQuantity // ignore: cast_nullable_to_non_nullable
as String,adjustmentType: null == adjustmentType ? _self.adjustmentType : adjustmentType // ignore: cast_nullable_to_non_nullable
as AdjustmentType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

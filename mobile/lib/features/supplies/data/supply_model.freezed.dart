// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supply_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupplyModel {

 String get id; String get farm;@JsonKey(name: 'storage_zone') String? get storageZone; String get name; SupplyCategory get category; String? get photo;@JsonKey(name: 'current_stock') String get currentStock;@JsonKey(name: 'total_capacity') String? get totalCapacity; SupplyUnit get unit;@JsonKey(name: 'batch_number') String? get batchNumber;@JsonKey(name: 'expiry_date') String? get expiryDate;@JsonKey(name: 'reorder_threshold_days') int? get reorderThresholdDays;@JsonKey(name: 'is_archived') bool get isArchived;
/// Create a copy of SupplyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplyModelCopyWith<SupplyModel> get copyWith => _$SupplyModelCopyWithImpl<SupplyModel>(this as SupplyModel, _$identity);

  /// Serializes this SupplyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SupplyModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplyModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.farm, _this.farm) || other.farm == _this.farm)&&(identical(other.storageZone, _this.storageZone) || other.storageZone == _this.storageZone)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.photo, _this.photo) || other.photo == _this.photo)&&(identical(other.currentStock, _this.currentStock) || other.currentStock == _this.currentStock)&&(identical(other.totalCapacity, _this.totalCapacity) || other.totalCapacity == _this.totalCapacity)&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&(identical(other.batchNumber, _this.batchNumber) || other.batchNumber == _this.batchNumber)&&(identical(other.expiryDate, _this.expiryDate) || other.expiryDate == _this.expiryDate)&&(identical(other.reorderThresholdDays, _this.reorderThresholdDays) || other.reorderThresholdDays == _this.reorderThresholdDays)&&(identical(other.isArchived, _this.isArchived) || other.isArchived == _this.isArchived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SupplyModel;
  return Object.hash(runtimeType,_this.id,_this.farm,_this.storageZone,_this.name,_this.category,_this.photo,_this.currentStock,_this.totalCapacity,_this.unit,_this.batchNumber,_this.expiryDate,_this.reorderThresholdDays,_this.isArchived);
}

@override
String toString() {
  final _this = this as SupplyModel;
  return 'SupplyModel(id: ${_this.id}, farm: ${_this.farm}, storageZone: ${_this.storageZone}, name: ${_this.name}, category: ${_this.category}, photo: ${_this.photo}, currentStock: ${_this.currentStock}, totalCapacity: ${_this.totalCapacity}, unit: ${_this.unit}, batchNumber: ${_this.batchNumber}, expiryDate: ${_this.expiryDate}, reorderThresholdDays: ${_this.reorderThresholdDays}, isArchived: ${_this.isArchived})';
}


}

/// @nodoc
abstract mixin class $SupplyModelCopyWith<$Res>  {
  factory $SupplyModelCopyWith(SupplyModel value, $Res Function(SupplyModel) _then) = _$SupplyModelCopyWithImpl;
@useResult
$Res call({
 String id, String farm,@JsonKey(name: 'storage_zone') String? storageZone, String name, SupplyCategory category, String? photo,@JsonKey(name: 'current_stock') String currentStock,@JsonKey(name: 'total_capacity') String? totalCapacity, SupplyUnit unit,@JsonKey(name: 'batch_number') String? batchNumber,@JsonKey(name: 'expiry_date') String? expiryDate,@JsonKey(name: 'reorder_threshold_days') int? reorderThresholdDays,@JsonKey(name: 'is_archived') bool isArchived
});




}
/// @nodoc
class _$SupplyModelCopyWithImpl<$Res>
    implements $SupplyModelCopyWith<$Res> {
  _$SupplyModelCopyWithImpl(this._self, this._then);

  final SupplyModel _self;
  final $Res Function(SupplyModel) _then;

/// Create a copy of SupplyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? farm = null,Object? storageZone = freezed,Object? name = null,Object? category = null,Object? photo = freezed,Object? currentStock = null,Object? totalCapacity = freezed,Object? unit = null,Object? batchNumber = freezed,Object? expiryDate = freezed,Object? reorderThresholdDays = freezed,Object? isArchived = null,}) {
  return _then(SupplyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,farm: null == farm ? _self.farm : farm // ignore: cast_nullable_to_non_nullable
as String,storageZone: freezed == storageZone ? _self.storageZone : storageZone // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as SupplyCategory,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,currentStock: null == currentStock ? _self.currentStock : currentStock // ignore: cast_nullable_to_non_nullable
as String,totalCapacity: freezed == totalCapacity ? _self.totalCapacity : totalCapacity // ignore: cast_nullable_to_non_nullable
as String?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as SupplyUnit,batchNumber: freezed == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String?,reorderThresholdDays: freezed == reorderThresholdDays ? _self.reorderThresholdDays : reorderThresholdDays // ignore: cast_nullable_to_non_nullable
as int?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplyModel].
extension SupplyModelPatterns on SupplyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplyModel value)  $default,){
final _that = this;
switch (_that) {
case _SupplyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplyModel value)?  $default,){
final _that = this;
switch (_that) {
case _SupplyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String farm, @JsonKey(name: 'storage_zone')  String? storageZone,  String name,  SupplyCategory category,  String? photo, @JsonKey(name: 'current_stock')  String currentStock, @JsonKey(name: 'total_capacity')  String? totalCapacity,  SupplyUnit unit, @JsonKey(name: 'batch_number')  String? batchNumber, @JsonKey(name: 'expiry_date')  String? expiryDate, @JsonKey(name: 'reorder_threshold_days')  int? reorderThresholdDays, @JsonKey(name: 'is_archived')  bool isArchived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplyModel() when $default != null:
return $default(_that.id,_that.farm,_that.storageZone,_that.name,_that.category,_that.photo,_that.currentStock,_that.totalCapacity,_that.unit,_that.batchNumber,_that.expiryDate,_that.reorderThresholdDays,_that.isArchived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String farm, @JsonKey(name: 'storage_zone')  String? storageZone,  String name,  SupplyCategory category,  String? photo, @JsonKey(name: 'current_stock')  String currentStock, @JsonKey(name: 'total_capacity')  String? totalCapacity,  SupplyUnit unit, @JsonKey(name: 'batch_number')  String? batchNumber, @JsonKey(name: 'expiry_date')  String? expiryDate, @JsonKey(name: 'reorder_threshold_days')  int? reorderThresholdDays, @JsonKey(name: 'is_archived')  bool isArchived)  $default,) {final _that = this;
switch (_that) {
case _SupplyModel():
return $default(_that.id,_that.farm,_that.storageZone,_that.name,_that.category,_that.photo,_that.currentStock,_that.totalCapacity,_that.unit,_that.batchNumber,_that.expiryDate,_that.reorderThresholdDays,_that.isArchived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String farm, @JsonKey(name: 'storage_zone')  String? storageZone,  String name,  SupplyCategory category,  String? photo, @JsonKey(name: 'current_stock')  String currentStock, @JsonKey(name: 'total_capacity')  String? totalCapacity,  SupplyUnit unit, @JsonKey(name: 'batch_number')  String? batchNumber, @JsonKey(name: 'expiry_date')  String? expiryDate, @JsonKey(name: 'reorder_threshold_days')  int? reorderThresholdDays, @JsonKey(name: 'is_archived')  bool isArchived)?  $default,) {final _that = this;
switch (_that) {
case _SupplyModel() when $default != null:
return $default(_that.id,_that.farm,_that.storageZone,_that.name,_that.category,_that.photo,_that.currentStock,_that.totalCapacity,_that.unit,_that.batchNumber,_that.expiryDate,_that.reorderThresholdDays,_that.isArchived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupplyModel extends SupplyModel {
  const _SupplyModel({required this.id, required this.farm, @JsonKey(name: 'storage_zone') this.storageZone, required this.name, required this.category, this.photo, @JsonKey(name: 'current_stock') required this.currentStock, @JsonKey(name: 'total_capacity') this.totalCapacity, required this.unit, @JsonKey(name: 'batch_number') this.batchNumber, @JsonKey(name: 'expiry_date') this.expiryDate, @JsonKey(name: 'reorder_threshold_days') this.reorderThresholdDays, @JsonKey(name: 'is_archived') this.isArchived = false}): super._();
  factory _SupplyModel.fromJson(Map<String, dynamic> json) => _$SupplyModelFromJson(json);

@override final  String id;
@override final  String farm;
@override@JsonKey(name: 'storage_zone') final  String? storageZone;
@override final  String name;
@override final  SupplyCategory category;
@override final  String? photo;
@override@JsonKey(name: 'current_stock') final  String currentStock;
@override@JsonKey(name: 'total_capacity') final  String? totalCapacity;
@override final  SupplyUnit unit;
@override@JsonKey(name: 'batch_number') final  String? batchNumber;
@override@JsonKey(name: 'expiry_date') final  String? expiryDate;
@override@JsonKey(name: 'reorder_threshold_days') final  int? reorderThresholdDays;
@override@JsonKey(name: 'is_archived') final  bool isArchived;

/// Create a copy of SupplyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplyModelCopyWith<_SupplyModel> get copyWith => __$SupplyModelCopyWithImpl<_SupplyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupplyModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.farm, farm) || other.farm == farm)&&(identical(other.storageZone, storageZone) || other.storageZone == storageZone)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.currentStock, currentStock) || other.currentStock == currentStock)&&(identical(other.totalCapacity, totalCapacity) || other.totalCapacity == totalCapacity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.reorderThresholdDays, reorderThresholdDays) || other.reorderThresholdDays == reorderThresholdDays)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,farm,storageZone,name,category,photo,currentStock,totalCapacity,unit,batchNumber,expiryDate,reorderThresholdDays,isArchived);
}

@override
String toString() {
    return 'SupplyModel(id: $id, farm: $farm, storageZone: $storageZone, name: $name, category: $category, photo: $photo, currentStock: $currentStock, totalCapacity: $totalCapacity, unit: $unit, batchNumber: $batchNumber, expiryDate: $expiryDate, reorderThresholdDays: $reorderThresholdDays, isArchived: $isArchived)';
}


}

/// @nodoc
abstract mixin class _$SupplyModelCopyWith<$Res> implements $SupplyModelCopyWith<$Res> {
  factory _$SupplyModelCopyWith(_SupplyModel value, $Res Function(_SupplyModel) _then) = __$SupplyModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String farm,@JsonKey(name: 'storage_zone') String? storageZone, String name, SupplyCategory category, String? photo,@JsonKey(name: 'current_stock') String currentStock,@JsonKey(name: 'total_capacity') String? totalCapacity, SupplyUnit unit,@JsonKey(name: 'batch_number') String? batchNumber,@JsonKey(name: 'expiry_date') String? expiryDate,@JsonKey(name: 'reorder_threshold_days') int? reorderThresholdDays,@JsonKey(name: 'is_archived') bool isArchived
});




}
/// @nodoc
class __$SupplyModelCopyWithImpl<$Res>
    implements _$SupplyModelCopyWith<$Res> {
  __$SupplyModelCopyWithImpl(this._self, this._then);

  final _SupplyModel _self;
  final $Res Function(_SupplyModel) _then;

/// Create a copy of SupplyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? farm = null,Object? storageZone = freezed,Object? name = null,Object? category = null,Object? photo = freezed,Object? currentStock = null,Object? totalCapacity = freezed,Object? unit = null,Object? batchNumber = freezed,Object? expiryDate = freezed,Object? reorderThresholdDays = freezed,Object? isArchived = null,}) {
  return _then(_SupplyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,farm: null == farm ? _self.farm : farm // ignore: cast_nullable_to_non_nullable
as String,storageZone: freezed == storageZone ? _self.storageZone : storageZone // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as SupplyCategory,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,currentStock: null == currentStock ? _self.currentStock : currentStock // ignore: cast_nullable_to_non_nullable
as String,totalCapacity: freezed == totalCapacity ? _self.totalCapacity : totalCapacity // ignore: cast_nullable_to_non_nullable
as String?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as SupplyUnit,batchNumber: freezed == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String?,reorderThresholdDays: freezed == reorderThresholdDays ? _self.reorderThresholdDays : reorderThresholdDays // ignore: cast_nullable_to_non_nullable
as int?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

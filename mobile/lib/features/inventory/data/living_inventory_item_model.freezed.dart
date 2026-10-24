// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'living_inventory_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LivingInventoryItemModel {

 String get id; String get farm; String? get zone;@JsonKey(name: 'domain_type') DomainType get domainType; String get name;@JsonKey(name: 'species_or_variety') String? get speciesOrVariety; int get quantity;@JsonKey(name: 'health_status') HealthStatus get healthStatus;@JsonKey(name: 'reference_photo') String? get referencePhoto;@JsonKey(name: 'is_archived') bool get isArchived; Map<String, dynamic>? get detail;
/// Create a copy of LivingInventoryItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivingInventoryItemModelCopyWith<LivingInventoryItemModel> get copyWith => _$LivingInventoryItemModelCopyWithImpl<LivingInventoryItemModel>(this as LivingInventoryItemModel, _$identity);

  /// Serializes this LivingInventoryItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LivingInventoryItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivingInventoryItemModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.farm, _this.farm) || other.farm == _this.farm)&&(identical(other.zone, _this.zone) || other.zone == _this.zone)&&(identical(other.domainType, _this.domainType) || other.domainType == _this.domainType)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.speciesOrVariety, _this.speciesOrVariety) || other.speciesOrVariety == _this.speciesOrVariety)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.healthStatus, _this.healthStatus) || other.healthStatus == _this.healthStatus)&&(identical(other.referencePhoto, _this.referencePhoto) || other.referencePhoto == _this.referencePhoto)&&(identical(other.isArchived, _this.isArchived) || other.isArchived == _this.isArchived)&&const DeepCollectionEquality().equals(other.detail, _this.detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LivingInventoryItemModel;
  return Object.hash(runtimeType,_this.id,_this.farm,_this.zone,_this.domainType,_this.name,_this.speciesOrVariety,_this.quantity,_this.healthStatus,_this.referencePhoto,_this.isArchived,const DeepCollectionEquality().hash(_this.detail));
}

@override
String toString() {
  final _this = this as LivingInventoryItemModel;
  return 'LivingInventoryItemModel(id: ${_this.id}, farm: ${_this.farm}, zone: ${_this.zone}, domainType: ${_this.domainType}, name: ${_this.name}, speciesOrVariety: ${_this.speciesOrVariety}, quantity: ${_this.quantity}, healthStatus: ${_this.healthStatus}, referencePhoto: ${_this.referencePhoto}, isArchived: ${_this.isArchived}, detail: ${_this.detail})';
}


}

/// @nodoc
abstract mixin class $LivingInventoryItemModelCopyWith<$Res>  {
  factory $LivingInventoryItemModelCopyWith(LivingInventoryItemModel value, $Res Function(LivingInventoryItemModel) _then) = _$LivingInventoryItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String farm, String? zone,@JsonKey(name: 'domain_type') DomainType domainType, String name,@JsonKey(name: 'species_or_variety') String? speciesOrVariety, int quantity,@JsonKey(name: 'health_status') HealthStatus healthStatus,@JsonKey(name: 'reference_photo') String? referencePhoto,@JsonKey(name: 'is_archived') bool isArchived, Map<String, dynamic>? detail
});




}
/// @nodoc
class _$LivingInventoryItemModelCopyWithImpl<$Res>
    implements $LivingInventoryItemModelCopyWith<$Res> {
  _$LivingInventoryItemModelCopyWithImpl(this._self, this._then);

  final LivingInventoryItemModel _self;
  final $Res Function(LivingInventoryItemModel) _then;

/// Create a copy of LivingInventoryItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? farm = null,Object? zone = freezed,Object? domainType = null,Object? name = null,Object? speciesOrVariety = freezed,Object? quantity = null,Object? healthStatus = null,Object? referencePhoto = freezed,Object? isArchived = null,Object? detail = freezed,}) {
  return _then(LivingInventoryItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,farm: null == farm ? _self.farm : farm // ignore: cast_nullable_to_non_nullable
as String,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as String?,domainType: null == domainType ? _self.domainType : domainType // ignore: cast_nullable_to_non_nullable
as DomainType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,speciesOrVariety: freezed == speciesOrVariety ? _self.speciesOrVariety : speciesOrVariety // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,healthStatus: null == healthStatus ? _self.healthStatus : healthStatus // ignore: cast_nullable_to_non_nullable
as HealthStatus,referencePhoto: freezed == referencePhoto ? _self.referencePhoto : referencePhoto // ignore: cast_nullable_to_non_nullable
as String?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [LivingInventoryItemModel].
extension LivingInventoryItemModelPatterns on LivingInventoryItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LivingInventoryItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LivingInventoryItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LivingInventoryItemModel value)  $default,){
final _that = this;
switch (_that) {
case _LivingInventoryItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LivingInventoryItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _LivingInventoryItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String farm,  String? zone, @JsonKey(name: 'domain_type')  DomainType domainType,  String name, @JsonKey(name: 'species_or_variety')  String? speciesOrVariety,  int quantity, @JsonKey(name: 'health_status')  HealthStatus healthStatus, @JsonKey(name: 'reference_photo')  String? referencePhoto, @JsonKey(name: 'is_archived')  bool isArchived,  Map<String, dynamic>? detail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LivingInventoryItemModel() when $default != null:
return $default(_that.id,_that.farm,_that.zone,_that.domainType,_that.name,_that.speciesOrVariety,_that.quantity,_that.healthStatus,_that.referencePhoto,_that.isArchived,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String farm,  String? zone, @JsonKey(name: 'domain_type')  DomainType domainType,  String name, @JsonKey(name: 'species_or_variety')  String? speciesOrVariety,  int quantity, @JsonKey(name: 'health_status')  HealthStatus healthStatus, @JsonKey(name: 'reference_photo')  String? referencePhoto, @JsonKey(name: 'is_archived')  bool isArchived,  Map<String, dynamic>? detail)  $default,) {final _that = this;
switch (_that) {
case _LivingInventoryItemModel():
return $default(_that.id,_that.farm,_that.zone,_that.domainType,_that.name,_that.speciesOrVariety,_that.quantity,_that.healthStatus,_that.referencePhoto,_that.isArchived,_that.detail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String farm,  String? zone, @JsonKey(name: 'domain_type')  DomainType domainType,  String name, @JsonKey(name: 'species_or_variety')  String? speciesOrVariety,  int quantity, @JsonKey(name: 'health_status')  HealthStatus healthStatus, @JsonKey(name: 'reference_photo')  String? referencePhoto, @JsonKey(name: 'is_archived')  bool isArchived,  Map<String, dynamic>? detail)?  $default,) {final _that = this;
switch (_that) {
case _LivingInventoryItemModel() when $default != null:
return $default(_that.id,_that.farm,_that.zone,_that.domainType,_that.name,_that.speciesOrVariety,_that.quantity,_that.healthStatus,_that.referencePhoto,_that.isArchived,_that.detail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LivingInventoryItemModel extends LivingInventoryItemModel {
  const _LivingInventoryItemModel({required this.id, required this.farm, this.zone, @JsonKey(name: 'domain_type') required this.domainType, required this.name, @JsonKey(name: 'species_or_variety') this.speciesOrVariety, required this.quantity, @JsonKey(name: 'health_status') required this.healthStatus, @JsonKey(name: 'reference_photo') this.referencePhoto, @JsonKey(name: 'is_archived') this.isArchived = false,  Map<String, dynamic>? detail}): _detail = detail,super._();
  factory _LivingInventoryItemModel.fromJson(Map<String, dynamic> json) => _$LivingInventoryItemModelFromJson(json);

@override final  String id;
@override final  String farm;
@override final  String? zone;
@override@JsonKey(name: 'domain_type') final  DomainType domainType;
@override final  String name;
@override@JsonKey(name: 'species_or_variety') final  String? speciesOrVariety;
@override final  int quantity;
@override@JsonKey(name: 'health_status') final  HealthStatus healthStatus;
@override@JsonKey(name: 'reference_photo') final  String? referencePhoto;
@override@JsonKey(name: 'is_archived') final  bool isArchived;
 final  Map<String, dynamic>? _detail;
@override Map<String, dynamic>? get detail {
  final value = _detail;
  if (value == null) return null;
  if (_detail is EqualUnmodifiableMapView) return _detail;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of LivingInventoryItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LivingInventoryItemModelCopyWith<_LivingInventoryItemModel> get copyWith => __$LivingInventoryItemModelCopyWithImpl<_LivingInventoryItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LivingInventoryItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LivingInventoryItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.farm, farm) || other.farm == farm)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.domainType, domainType) || other.domainType == domainType)&&(identical(other.name, name) || other.name == name)&&(identical(other.speciesOrVariety, speciesOrVariety) || other.speciesOrVariety == speciesOrVariety)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.healthStatus, healthStatus) || other.healthStatus == healthStatus)&&(identical(other.referencePhoto, referencePhoto) || other.referencePhoto == referencePhoto)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&const DeepCollectionEquality().equals(other.detail, _detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,farm,zone,domainType,name,speciesOrVariety,quantity,healthStatus,referencePhoto,isArchived,const DeepCollectionEquality().hash(_detail));
}

@override
String toString() {
    return 'LivingInventoryItemModel(id: $id, farm: $farm, zone: $zone, domainType: $domainType, name: $name, speciesOrVariety: $speciesOrVariety, quantity: $quantity, healthStatus: $healthStatus, referencePhoto: $referencePhoto, isArchived: $isArchived, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$LivingInventoryItemModelCopyWith<$Res> implements $LivingInventoryItemModelCopyWith<$Res> {
  factory _$LivingInventoryItemModelCopyWith(_LivingInventoryItemModel value, $Res Function(_LivingInventoryItemModel) _then) = __$LivingInventoryItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String farm, String? zone,@JsonKey(name: 'domain_type') DomainType domainType, String name,@JsonKey(name: 'species_or_variety') String? speciesOrVariety, int quantity,@JsonKey(name: 'health_status') HealthStatus healthStatus,@JsonKey(name: 'reference_photo') String? referencePhoto,@JsonKey(name: 'is_archived') bool isArchived, Map<String, dynamic>? detail
});




}
/// @nodoc
class __$LivingInventoryItemModelCopyWithImpl<$Res>
    implements _$LivingInventoryItemModelCopyWith<$Res> {
  __$LivingInventoryItemModelCopyWithImpl(this._self, this._then);

  final _LivingInventoryItemModel _self;
  final $Res Function(_LivingInventoryItemModel) _then;

/// Create a copy of LivingInventoryItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? farm = null,Object? zone = freezed,Object? domainType = null,Object? name = null,Object? speciesOrVariety = freezed,Object? quantity = null,Object? healthStatus = null,Object? referencePhoto = freezed,Object? isArchived = null,Object? detail = freezed,}) {
  return _then(_LivingInventoryItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,farm: null == farm ? _self.farm : farm // ignore: cast_nullable_to_non_nullable
as String,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as String?,domainType: null == domainType ? _self.domainType : domainType // ignore: cast_nullable_to_non_nullable
as DomainType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,speciesOrVariety: freezed == speciesOrVariety ? _self.speciesOrVariety : speciesOrVariety // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,healthStatus: null == healthStatus ? _self.healthStatus : healthStatus // ignore: cast_nullable_to_non_nullable
as HealthStatus,referencePhoto: freezed == referencePhoto ? _self.referencePhoto : referencePhoto // ignore: cast_nullable_to_non_nullable
as String?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,detail: freezed == detail ? _self._detail : detail // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_entry_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HealthLogEntryModel {

 String get id; HealthSeverity get severity;@JsonKey(name: 'issue_description') String? get issueDescription;@JsonKey(name: 'treatment_required') String? get treatmentRequired;@JsonKey(name: 'doctor_name') String? get doctorName; String? get note;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of HealthLogEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthLogEntryModelCopyWith<HealthLogEntryModel> get copyWith => _$HealthLogEntryModelCopyWithImpl<HealthLogEntryModel>(this as HealthLogEntryModel, _$identity);

  /// Serializes this HealthLogEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HealthLogEntryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthLogEntryModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.severity, _this.severity) || other.severity == _this.severity)&&(identical(other.issueDescription, _this.issueDescription) || other.issueDescription == _this.issueDescription)&&(identical(other.treatmentRequired, _this.treatmentRequired) || other.treatmentRequired == _this.treatmentRequired)&&(identical(other.doctorName, _this.doctorName) || other.doctorName == _this.doctorName)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HealthLogEntryModel;
  return Object.hash(runtimeType,_this.id,_this.severity,_this.issueDescription,_this.treatmentRequired,_this.doctorName,_this.note,_this.createdAt);
}

@override
String toString() {
  final _this = this as HealthLogEntryModel;
  return 'HealthLogEntryModel(id: ${_this.id}, severity: ${_this.severity}, issueDescription: ${_this.issueDescription}, treatmentRequired: ${_this.treatmentRequired}, doctorName: ${_this.doctorName}, note: ${_this.note}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $HealthLogEntryModelCopyWith<$Res>  {
  factory $HealthLogEntryModelCopyWith(HealthLogEntryModel value, $Res Function(HealthLogEntryModel) _then) = _$HealthLogEntryModelCopyWithImpl;
@useResult
$Res call({
 String id, HealthSeverity severity,@JsonKey(name: 'issue_description') String? issueDescription,@JsonKey(name: 'treatment_required') String? treatmentRequired,@JsonKey(name: 'doctor_name') String? doctorName, String? note,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$HealthLogEntryModelCopyWithImpl<$Res>
    implements $HealthLogEntryModelCopyWith<$Res> {
  _$HealthLogEntryModelCopyWithImpl(this._self, this._then);

  final HealthLogEntryModel _self;
  final $Res Function(HealthLogEntryModel) _then;

/// Create a copy of HealthLogEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? severity = null,Object? issueDescription = freezed,Object? treatmentRequired = freezed,Object? doctorName = freezed,Object? note = freezed,Object? createdAt = null,}) {
  return _then(HealthLogEntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as HealthSeverity,issueDescription: freezed == issueDescription ? _self.issueDescription : issueDescription // ignore: cast_nullable_to_non_nullable
as String?,treatmentRequired: freezed == treatmentRequired ? _self.treatmentRequired : treatmentRequired // ignore: cast_nullable_to_non_nullable
as String?,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthLogEntryModel].
extension HealthLogEntryModelPatterns on HealthLogEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthLogEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthLogEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthLogEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _HealthLogEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthLogEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _HealthLogEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  HealthSeverity severity, @JsonKey(name: 'issue_description')  String? issueDescription, @JsonKey(name: 'treatment_required')  String? treatmentRequired, @JsonKey(name: 'doctor_name')  String? doctorName,  String? note, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthLogEntryModel() when $default != null:
return $default(_that.id,_that.severity,_that.issueDescription,_that.treatmentRequired,_that.doctorName,_that.note,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  HealthSeverity severity, @JsonKey(name: 'issue_description')  String? issueDescription, @JsonKey(name: 'treatment_required')  String? treatmentRequired, @JsonKey(name: 'doctor_name')  String? doctorName,  String? note, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _HealthLogEntryModel():
return $default(_that.id,_that.severity,_that.issueDescription,_that.treatmentRequired,_that.doctorName,_that.note,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  HealthSeverity severity, @JsonKey(name: 'issue_description')  String? issueDescription, @JsonKey(name: 'treatment_required')  String? treatmentRequired, @JsonKey(name: 'doctor_name')  String? doctorName,  String? note, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _HealthLogEntryModel() when $default != null:
return $default(_that.id,_that.severity,_that.issueDescription,_that.treatmentRequired,_that.doctorName,_that.note,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthLogEntryModel implements HealthLogEntryModel {
  const _HealthLogEntryModel({required this.id, required this.severity, @JsonKey(name: 'issue_description') this.issueDescription, @JsonKey(name: 'treatment_required') this.treatmentRequired, @JsonKey(name: 'doctor_name') this.doctorName, this.note, @JsonKey(name: 'created_at') required this.createdAt});
  factory _HealthLogEntryModel.fromJson(Map<String, dynamic> json) => _$HealthLogEntryModelFromJson(json);

@override final  String id;
@override final  HealthSeverity severity;
@override@JsonKey(name: 'issue_description') final  String? issueDescription;
@override@JsonKey(name: 'treatment_required') final  String? treatmentRequired;
@override@JsonKey(name: 'doctor_name') final  String? doctorName;
@override final  String? note;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of HealthLogEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthLogEntryModelCopyWith<_HealthLogEntryModel> get copyWith => __$HealthLogEntryModelCopyWithImpl<_HealthLogEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthLogEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthLogEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.issueDescription, issueDescription) || other.issueDescription == issueDescription)&&(identical(other.treatmentRequired, treatmentRequired) || other.treatmentRequired == treatmentRequired)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,severity,issueDescription,treatmentRequired,doctorName,note,createdAt);
}

@override
String toString() {
    return 'HealthLogEntryModel(id: $id, severity: $severity, issueDescription: $issueDescription, treatmentRequired: $treatmentRequired, doctorName: $doctorName, note: $note, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$HealthLogEntryModelCopyWith<$Res> implements $HealthLogEntryModelCopyWith<$Res> {
  factory _$HealthLogEntryModelCopyWith(_HealthLogEntryModel value, $Res Function(_HealthLogEntryModel) _then) = __$HealthLogEntryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, HealthSeverity severity,@JsonKey(name: 'issue_description') String? issueDescription,@JsonKey(name: 'treatment_required') String? treatmentRequired,@JsonKey(name: 'doctor_name') String? doctorName, String? note,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$HealthLogEntryModelCopyWithImpl<$Res>
    implements _$HealthLogEntryModelCopyWith<$Res> {
  __$HealthLogEntryModelCopyWithImpl(this._self, this._then);

  final _HealthLogEntryModel _self;
  final $Res Function(_HealthLogEntryModel) _then;

/// Create a copy of HealthLogEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? severity = null,Object? issueDescription = freezed,Object? treatmentRequired = freezed,Object? doctorName = freezed,Object? note = freezed,Object? createdAt = null,}) {
  return _then(_HealthLogEntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as HealthSeverity,issueDescription: freezed == issueDescription ? _self.issueDescription : issueDescription // ignore: cast_nullable_to_non_nullable
as String?,treatmentRequired: freezed == treatmentRequired ? _self.treatmentRequired : treatmentRequired // ignore: cast_nullable_to_non_nullable
as String?,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProductionLogEntryModel {

 String get id;@JsonKey(name: 'individual_id_tag') String? get individualIdTag;@JsonKey(name: 'metric_type') String get metricType; String get value; String get unit;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of ProductionLogEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductionLogEntryModelCopyWith<ProductionLogEntryModel> get copyWith => _$ProductionLogEntryModelCopyWithImpl<ProductionLogEntryModel>(this as ProductionLogEntryModel, _$identity);

  /// Serializes this ProductionLogEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductionLogEntryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductionLogEntryModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.individualIdTag, _this.individualIdTag) || other.individualIdTag == _this.individualIdTag)&&(identical(other.metricType, _this.metricType) || other.metricType == _this.metricType)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductionLogEntryModel;
  return Object.hash(runtimeType,_this.id,_this.individualIdTag,_this.metricType,_this.value,_this.unit,_this.createdAt);
}

@override
String toString() {
  final _this = this as ProductionLogEntryModel;
  return 'ProductionLogEntryModel(id: ${_this.id}, individualIdTag: ${_this.individualIdTag}, metricType: ${_this.metricType}, value: ${_this.value}, unit: ${_this.unit}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ProductionLogEntryModelCopyWith<$Res>  {
  factory $ProductionLogEntryModelCopyWith(ProductionLogEntryModel value, $Res Function(ProductionLogEntryModel) _then) = _$ProductionLogEntryModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'individual_id_tag') String? individualIdTag,@JsonKey(name: 'metric_type') String metricType, String value, String unit,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$ProductionLogEntryModelCopyWithImpl<$Res>
    implements $ProductionLogEntryModelCopyWith<$Res> {
  _$ProductionLogEntryModelCopyWithImpl(this._self, this._then);

  final ProductionLogEntryModel _self;
  final $Res Function(ProductionLogEntryModel) _then;

/// Create a copy of ProductionLogEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? individualIdTag = freezed,Object? metricType = null,Object? value = null,Object? unit = null,Object? createdAt = null,}) {
  return _then(ProductionLogEntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,individualIdTag: freezed == individualIdTag ? _self.individualIdTag : individualIdTag // ignore: cast_nullable_to_non_nullable
as String?,metricType: null == metricType ? _self.metricType : metricType // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductionLogEntryModel].
extension ProductionLogEntryModelPatterns on ProductionLogEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductionLogEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductionLogEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductionLogEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductionLogEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductionLogEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductionLogEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'individual_id_tag')  String? individualIdTag, @JsonKey(name: 'metric_type')  String metricType,  String value,  String unit, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductionLogEntryModel() when $default != null:
return $default(_that.id,_that.individualIdTag,_that.metricType,_that.value,_that.unit,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'individual_id_tag')  String? individualIdTag, @JsonKey(name: 'metric_type')  String metricType,  String value,  String unit, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _ProductionLogEntryModel():
return $default(_that.id,_that.individualIdTag,_that.metricType,_that.value,_that.unit,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'individual_id_tag')  String? individualIdTag, @JsonKey(name: 'metric_type')  String metricType,  String value,  String unit, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ProductionLogEntryModel() when $default != null:
return $default(_that.id,_that.individualIdTag,_that.metricType,_that.value,_that.unit,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductionLogEntryModel implements ProductionLogEntryModel {
  const _ProductionLogEntryModel({required this.id, @JsonKey(name: 'individual_id_tag') this.individualIdTag, @JsonKey(name: 'metric_type') required this.metricType, required this.value, required this.unit, @JsonKey(name: 'created_at') required this.createdAt});
  factory _ProductionLogEntryModel.fromJson(Map<String, dynamic> json) => _$ProductionLogEntryModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'individual_id_tag') final  String? individualIdTag;
@override@JsonKey(name: 'metric_type') final  String metricType;
@override final  String value;
@override final  String unit;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of ProductionLogEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductionLogEntryModelCopyWith<_ProductionLogEntryModel> get copyWith => __$ProductionLogEntryModelCopyWithImpl<_ProductionLogEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductionLogEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductionLogEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.individualIdTag, individualIdTag) || other.individualIdTag == individualIdTag)&&(identical(other.metricType, metricType) || other.metricType == metricType)&&(identical(other.value, value) || other.value == value)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,individualIdTag,metricType,value,unit,createdAt);
}

@override
String toString() {
    return 'ProductionLogEntryModel(id: $id, individualIdTag: $individualIdTag, metricType: $metricType, value: $value, unit: $unit, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ProductionLogEntryModelCopyWith<$Res> implements $ProductionLogEntryModelCopyWith<$Res> {
  factory _$ProductionLogEntryModelCopyWith(_ProductionLogEntryModel value, $Res Function(_ProductionLogEntryModel) _then) = __$ProductionLogEntryModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'individual_id_tag') String? individualIdTag,@JsonKey(name: 'metric_type') String metricType, String value, String unit,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$ProductionLogEntryModelCopyWithImpl<$Res>
    implements _$ProductionLogEntryModelCopyWith<$Res> {
  __$ProductionLogEntryModelCopyWithImpl(this._self, this._then);

  final _ProductionLogEntryModel _self;
  final $Res Function(_ProductionLogEntryModel) _then;

/// Create a copy of ProductionLogEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? individualIdTag = freezed,Object? metricType = null,Object? value = null,Object? unit = null,Object? createdAt = null,}) {
  return _then(_ProductionLogEntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,individualIdTag: freezed == individualIdTag ? _self.individualIdTag : individualIdTag // ignore: cast_nullable_to_non_nullable
as String?,metricType: null == metricType ? _self.metricType : metricType // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BreedingLogEntryModel {

 String get id;@JsonKey(name: 'individual_id_tag') String? get individualIdTag;@JsonKey(name: 'last_mating_date') String? get lastMatingDate;@JsonKey(name: 'breeding_status') String get breedingStatus;@JsonKey(name: 'expected_delivery_date') String? get expectedDeliveryDate;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of BreedingLogEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreedingLogEntryModelCopyWith<BreedingLogEntryModel> get copyWith => _$BreedingLogEntryModelCopyWithImpl<BreedingLogEntryModel>(this as BreedingLogEntryModel, _$identity);

  /// Serializes this BreedingLogEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BreedingLogEntryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreedingLogEntryModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.individualIdTag, _this.individualIdTag) || other.individualIdTag == _this.individualIdTag)&&(identical(other.lastMatingDate, _this.lastMatingDate) || other.lastMatingDate == _this.lastMatingDate)&&(identical(other.breedingStatus, _this.breedingStatus) || other.breedingStatus == _this.breedingStatus)&&(identical(other.expectedDeliveryDate, _this.expectedDeliveryDate) || other.expectedDeliveryDate == _this.expectedDeliveryDate)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BreedingLogEntryModel;
  return Object.hash(runtimeType,_this.id,_this.individualIdTag,_this.lastMatingDate,_this.breedingStatus,_this.expectedDeliveryDate,_this.createdAt);
}

@override
String toString() {
  final _this = this as BreedingLogEntryModel;
  return 'BreedingLogEntryModel(id: ${_this.id}, individualIdTag: ${_this.individualIdTag}, lastMatingDate: ${_this.lastMatingDate}, breedingStatus: ${_this.breedingStatus}, expectedDeliveryDate: ${_this.expectedDeliveryDate}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $BreedingLogEntryModelCopyWith<$Res>  {
  factory $BreedingLogEntryModelCopyWith(BreedingLogEntryModel value, $Res Function(BreedingLogEntryModel) _then) = _$BreedingLogEntryModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'individual_id_tag') String? individualIdTag,@JsonKey(name: 'last_mating_date') String? lastMatingDate,@JsonKey(name: 'breeding_status') String breedingStatus,@JsonKey(name: 'expected_delivery_date') String? expectedDeliveryDate,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$BreedingLogEntryModelCopyWithImpl<$Res>
    implements $BreedingLogEntryModelCopyWith<$Res> {
  _$BreedingLogEntryModelCopyWithImpl(this._self, this._then);

  final BreedingLogEntryModel _self;
  final $Res Function(BreedingLogEntryModel) _then;

/// Create a copy of BreedingLogEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? individualIdTag = freezed,Object? lastMatingDate = freezed,Object? breedingStatus = null,Object? expectedDeliveryDate = freezed,Object? createdAt = null,}) {
  return _then(BreedingLogEntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,individualIdTag: freezed == individualIdTag ? _self.individualIdTag : individualIdTag // ignore: cast_nullable_to_non_nullable
as String?,lastMatingDate: freezed == lastMatingDate ? _self.lastMatingDate : lastMatingDate // ignore: cast_nullable_to_non_nullable
as String?,breedingStatus: null == breedingStatus ? _self.breedingStatus : breedingStatus // ignore: cast_nullable_to_non_nullable
as String,expectedDeliveryDate: freezed == expectedDeliveryDate ? _self.expectedDeliveryDate : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BreedingLogEntryModel].
extension BreedingLogEntryModelPatterns on BreedingLogEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BreedingLogEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BreedingLogEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BreedingLogEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _BreedingLogEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BreedingLogEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _BreedingLogEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'individual_id_tag')  String? individualIdTag, @JsonKey(name: 'last_mating_date')  String? lastMatingDate, @JsonKey(name: 'breeding_status')  String breedingStatus, @JsonKey(name: 'expected_delivery_date')  String? expectedDeliveryDate, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BreedingLogEntryModel() when $default != null:
return $default(_that.id,_that.individualIdTag,_that.lastMatingDate,_that.breedingStatus,_that.expectedDeliveryDate,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'individual_id_tag')  String? individualIdTag, @JsonKey(name: 'last_mating_date')  String? lastMatingDate, @JsonKey(name: 'breeding_status')  String breedingStatus, @JsonKey(name: 'expected_delivery_date')  String? expectedDeliveryDate, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _BreedingLogEntryModel():
return $default(_that.id,_that.individualIdTag,_that.lastMatingDate,_that.breedingStatus,_that.expectedDeliveryDate,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'individual_id_tag')  String? individualIdTag, @JsonKey(name: 'last_mating_date')  String? lastMatingDate, @JsonKey(name: 'breeding_status')  String breedingStatus, @JsonKey(name: 'expected_delivery_date')  String? expectedDeliveryDate, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BreedingLogEntryModel() when $default != null:
return $default(_that.id,_that.individualIdTag,_that.lastMatingDate,_that.breedingStatus,_that.expectedDeliveryDate,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BreedingLogEntryModel implements BreedingLogEntryModel {
  const _BreedingLogEntryModel({required this.id, @JsonKey(name: 'individual_id_tag') this.individualIdTag, @JsonKey(name: 'last_mating_date') this.lastMatingDate, @JsonKey(name: 'breeding_status') required this.breedingStatus, @JsonKey(name: 'expected_delivery_date') this.expectedDeliveryDate, @JsonKey(name: 'created_at') required this.createdAt});
  factory _BreedingLogEntryModel.fromJson(Map<String, dynamic> json) => _$BreedingLogEntryModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'individual_id_tag') final  String? individualIdTag;
@override@JsonKey(name: 'last_mating_date') final  String? lastMatingDate;
@override@JsonKey(name: 'breeding_status') final  String breedingStatus;
@override@JsonKey(name: 'expected_delivery_date') final  String? expectedDeliveryDate;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of BreedingLogEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreedingLogEntryModelCopyWith<_BreedingLogEntryModel> get copyWith => __$BreedingLogEntryModelCopyWithImpl<_BreedingLogEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BreedingLogEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreedingLogEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.individualIdTag, individualIdTag) || other.individualIdTag == individualIdTag)&&(identical(other.lastMatingDate, lastMatingDate) || other.lastMatingDate == lastMatingDate)&&(identical(other.breedingStatus, breedingStatus) || other.breedingStatus == breedingStatus)&&(identical(other.expectedDeliveryDate, expectedDeliveryDate) || other.expectedDeliveryDate == expectedDeliveryDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,individualIdTag,lastMatingDate,breedingStatus,expectedDeliveryDate,createdAt);
}

@override
String toString() {
    return 'BreedingLogEntryModel(id: $id, individualIdTag: $individualIdTag, lastMatingDate: $lastMatingDate, breedingStatus: $breedingStatus, expectedDeliveryDate: $expectedDeliveryDate, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BreedingLogEntryModelCopyWith<$Res> implements $BreedingLogEntryModelCopyWith<$Res> {
  factory _$BreedingLogEntryModelCopyWith(_BreedingLogEntryModel value, $Res Function(_BreedingLogEntryModel) _then) = __$BreedingLogEntryModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'individual_id_tag') String? individualIdTag,@JsonKey(name: 'last_mating_date') String? lastMatingDate,@JsonKey(name: 'breeding_status') String breedingStatus,@JsonKey(name: 'expected_delivery_date') String? expectedDeliveryDate,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$BreedingLogEntryModelCopyWithImpl<$Res>
    implements _$BreedingLogEntryModelCopyWith<$Res> {
  __$BreedingLogEntryModelCopyWithImpl(this._self, this._then);

  final _BreedingLogEntryModel _self;
  final $Res Function(_BreedingLogEntryModel) _then;

/// Create a copy of BreedingLogEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? individualIdTag = freezed,Object? lastMatingDate = freezed,Object? breedingStatus = null,Object? expectedDeliveryDate = freezed,Object? createdAt = null,}) {
  return _then(_BreedingLogEntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,individualIdTag: freezed == individualIdTag ? _self.individualIdTag : individualIdTag // ignore: cast_nullable_to_non_nullable
as String?,lastMatingDate: freezed == lastMatingDate ? _self.lastMatingDate : lastMatingDate // ignore: cast_nullable_to_non_nullable
as String?,breedingStatus: null == breedingStatus ? _self.breedingStatus : breedingStatus // ignore: cast_nullable_to_non_nullable
as String,expectedDeliveryDate: freezed == expectedDeliveryDate ? _self.expectedDeliveryDate : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

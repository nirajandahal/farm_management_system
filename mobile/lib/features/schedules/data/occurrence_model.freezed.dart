// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'occurrence_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OccurrenceModel {

 String get id; String get schedule; String get title;@JsonKey(name: 'due_date') String get dueDate;@JsonKey(name: 'due_time') String? get dueTime; OccurrenceStatus get status;@JsonKey(name: 'completed_at') String? get completedAt;@JsonKey(name: 'completed_by') String? get completedBy;@JsonKey(name: 'actual_quantity') String? get actualQuantity;@JsonKey(name: 'skip_reason') String? get skipReason; String? get note;@JsonKey(name: 'geotag_lat') double? get geotagLat;@JsonKey(name: 'geotag_lng') double? get geotagLng; ScheduleUrgency get urgency;
/// Create a copy of OccurrenceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OccurrenceModelCopyWith<OccurrenceModel> get copyWith => _$OccurrenceModelCopyWithImpl<OccurrenceModel>(this as OccurrenceModel, _$identity);

  /// Serializes this OccurrenceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OccurrenceModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OccurrenceModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.schedule, _this.schedule) || other.schedule == _this.schedule)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.dueDate, _this.dueDate) || other.dueDate == _this.dueDate)&&(identical(other.dueTime, _this.dueTime) || other.dueTime == _this.dueTime)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&(identical(other.completedBy, _this.completedBy) || other.completedBy == _this.completedBy)&&(identical(other.actualQuantity, _this.actualQuantity) || other.actualQuantity == _this.actualQuantity)&&(identical(other.skipReason, _this.skipReason) || other.skipReason == _this.skipReason)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.geotagLat, _this.geotagLat) || other.geotagLat == _this.geotagLat)&&(identical(other.geotagLng, _this.geotagLng) || other.geotagLng == _this.geotagLng)&&(identical(other.urgency, _this.urgency) || other.urgency == _this.urgency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OccurrenceModel;
  return Object.hash(runtimeType,_this.id,_this.schedule,_this.title,_this.dueDate,_this.dueTime,_this.status,_this.completedAt,_this.completedBy,_this.actualQuantity,_this.skipReason,_this.note,_this.geotagLat,_this.geotagLng,_this.urgency);
}

@override
String toString() {
  final _this = this as OccurrenceModel;
  return 'OccurrenceModel(id: ${_this.id}, schedule: ${_this.schedule}, title: ${_this.title}, dueDate: ${_this.dueDate}, dueTime: ${_this.dueTime}, status: ${_this.status}, completedAt: ${_this.completedAt}, completedBy: ${_this.completedBy}, actualQuantity: ${_this.actualQuantity}, skipReason: ${_this.skipReason}, note: ${_this.note}, geotagLat: ${_this.geotagLat}, geotagLng: ${_this.geotagLng}, urgency: ${_this.urgency})';
}


}

/// @nodoc
abstract mixin class $OccurrenceModelCopyWith<$Res>  {
  factory $OccurrenceModelCopyWith(OccurrenceModel value, $Res Function(OccurrenceModel) _then) = _$OccurrenceModelCopyWithImpl;
@useResult
$Res call({
 String id, String schedule, String title,@JsonKey(name: 'due_date') String dueDate,@JsonKey(name: 'due_time') String? dueTime, OccurrenceStatus status,@JsonKey(name: 'completed_at') String? completedAt,@JsonKey(name: 'completed_by') String? completedBy,@JsonKey(name: 'actual_quantity') String? actualQuantity,@JsonKey(name: 'skip_reason') String? skipReason, String? note,@JsonKey(name: 'geotag_lat') double? geotagLat,@JsonKey(name: 'geotag_lng') double? geotagLng, ScheduleUrgency urgency
});




}
/// @nodoc
class _$OccurrenceModelCopyWithImpl<$Res>
    implements $OccurrenceModelCopyWith<$Res> {
  _$OccurrenceModelCopyWithImpl(this._self, this._then);

  final OccurrenceModel _self;
  final $Res Function(OccurrenceModel) _then;

/// Create a copy of OccurrenceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schedule = null,Object? title = null,Object? dueDate = null,Object? dueTime = freezed,Object? status = null,Object? completedAt = freezed,Object? completedBy = freezed,Object? actualQuantity = freezed,Object? skipReason = freezed,Object? note = freezed,Object? geotagLat = freezed,Object? geotagLng = freezed,Object? urgency = null,}) {
  return _then(OccurrenceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,dueTime: freezed == dueTime ? _self.dueTime : dueTime // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OccurrenceStatus,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,completedBy: freezed == completedBy ? _self.completedBy : completedBy // ignore: cast_nullable_to_non_nullable
as String?,actualQuantity: freezed == actualQuantity ? _self.actualQuantity : actualQuantity // ignore: cast_nullable_to_non_nullable
as String?,skipReason: freezed == skipReason ? _self.skipReason : skipReason // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,geotagLat: freezed == geotagLat ? _self.geotagLat : geotagLat // ignore: cast_nullable_to_non_nullable
as double?,geotagLng: freezed == geotagLng ? _self.geotagLng : geotagLng // ignore: cast_nullable_to_non_nullable
as double?,urgency: null == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as ScheduleUrgency,
  ));
}

}


/// Adds pattern-matching-related methods to [OccurrenceModel].
extension OccurrenceModelPatterns on OccurrenceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OccurrenceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OccurrenceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OccurrenceModel value)  $default,){
final _that = this;
switch (_that) {
case _OccurrenceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OccurrenceModel value)?  $default,){
final _that = this;
switch (_that) {
case _OccurrenceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String schedule,  String title, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(name: 'due_time')  String? dueTime,  OccurrenceStatus status, @JsonKey(name: 'completed_at')  String? completedAt, @JsonKey(name: 'completed_by')  String? completedBy, @JsonKey(name: 'actual_quantity')  String? actualQuantity, @JsonKey(name: 'skip_reason')  String? skipReason,  String? note, @JsonKey(name: 'geotag_lat')  double? geotagLat, @JsonKey(name: 'geotag_lng')  double? geotagLng,  ScheduleUrgency urgency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OccurrenceModel() when $default != null:
return $default(_that.id,_that.schedule,_that.title,_that.dueDate,_that.dueTime,_that.status,_that.completedAt,_that.completedBy,_that.actualQuantity,_that.skipReason,_that.note,_that.geotagLat,_that.geotagLng,_that.urgency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String schedule,  String title, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(name: 'due_time')  String? dueTime,  OccurrenceStatus status, @JsonKey(name: 'completed_at')  String? completedAt, @JsonKey(name: 'completed_by')  String? completedBy, @JsonKey(name: 'actual_quantity')  String? actualQuantity, @JsonKey(name: 'skip_reason')  String? skipReason,  String? note, @JsonKey(name: 'geotag_lat')  double? geotagLat, @JsonKey(name: 'geotag_lng')  double? geotagLng,  ScheduleUrgency urgency)  $default,) {final _that = this;
switch (_that) {
case _OccurrenceModel():
return $default(_that.id,_that.schedule,_that.title,_that.dueDate,_that.dueTime,_that.status,_that.completedAt,_that.completedBy,_that.actualQuantity,_that.skipReason,_that.note,_that.geotagLat,_that.geotagLng,_that.urgency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String schedule,  String title, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(name: 'due_time')  String? dueTime,  OccurrenceStatus status, @JsonKey(name: 'completed_at')  String? completedAt, @JsonKey(name: 'completed_by')  String? completedBy, @JsonKey(name: 'actual_quantity')  String? actualQuantity, @JsonKey(name: 'skip_reason')  String? skipReason,  String? note, @JsonKey(name: 'geotag_lat')  double? geotagLat, @JsonKey(name: 'geotag_lng')  double? geotagLng,  ScheduleUrgency urgency)?  $default,) {final _that = this;
switch (_that) {
case _OccurrenceModel() when $default != null:
return $default(_that.id,_that.schedule,_that.title,_that.dueDate,_that.dueTime,_that.status,_that.completedAt,_that.completedBy,_that.actualQuantity,_that.skipReason,_that.note,_that.geotagLat,_that.geotagLng,_that.urgency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OccurrenceModel implements OccurrenceModel {
  const _OccurrenceModel({required this.id, required this.schedule, required this.title, @JsonKey(name: 'due_date') required this.dueDate, @JsonKey(name: 'due_time') this.dueTime, required this.status, @JsonKey(name: 'completed_at') this.completedAt, @JsonKey(name: 'completed_by') this.completedBy, @JsonKey(name: 'actual_quantity') this.actualQuantity, @JsonKey(name: 'skip_reason') this.skipReason, this.note, @JsonKey(name: 'geotag_lat') this.geotagLat, @JsonKey(name: 'geotag_lng') this.geotagLng, this.urgency = ScheduleUrgency.routine});
  factory _OccurrenceModel.fromJson(Map<String, dynamic> json) => _$OccurrenceModelFromJson(json);

@override final  String id;
@override final  String schedule;
@override final  String title;
@override@JsonKey(name: 'due_date') final  String dueDate;
@override@JsonKey(name: 'due_time') final  String? dueTime;
@override final  OccurrenceStatus status;
@override@JsonKey(name: 'completed_at') final  String? completedAt;
@override@JsonKey(name: 'completed_by') final  String? completedBy;
@override@JsonKey(name: 'actual_quantity') final  String? actualQuantity;
@override@JsonKey(name: 'skip_reason') final  String? skipReason;
@override final  String? note;
@override@JsonKey(name: 'geotag_lat') final  double? geotagLat;
@override@JsonKey(name: 'geotag_lng') final  double? geotagLng;
@override@JsonKey() final  ScheduleUrgency urgency;

/// Create a copy of OccurrenceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OccurrenceModelCopyWith<_OccurrenceModel> get copyWith => __$OccurrenceModelCopyWithImpl<_OccurrenceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OccurrenceModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OccurrenceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.title, title) || other.title == title)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.dueTime, dueTime) || other.dueTime == dueTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.completedBy, completedBy) || other.completedBy == completedBy)&&(identical(other.actualQuantity, actualQuantity) || other.actualQuantity == actualQuantity)&&(identical(other.skipReason, skipReason) || other.skipReason == skipReason)&&(identical(other.note, note) || other.note == note)&&(identical(other.geotagLat, geotagLat) || other.geotagLat == geotagLat)&&(identical(other.geotagLng, geotagLng) || other.geotagLng == geotagLng)&&(identical(other.urgency, urgency) || other.urgency == urgency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,schedule,title,dueDate,dueTime,status,completedAt,completedBy,actualQuantity,skipReason,note,geotagLat,geotagLng,urgency);
}

@override
String toString() {
    return 'OccurrenceModel(id: $id, schedule: $schedule, title: $title, dueDate: $dueDate, dueTime: $dueTime, status: $status, completedAt: $completedAt, completedBy: $completedBy, actualQuantity: $actualQuantity, skipReason: $skipReason, note: $note, geotagLat: $geotagLat, geotagLng: $geotagLng, urgency: $urgency)';
}


}

/// @nodoc
abstract mixin class _$OccurrenceModelCopyWith<$Res> implements $OccurrenceModelCopyWith<$Res> {
  factory _$OccurrenceModelCopyWith(_OccurrenceModel value, $Res Function(_OccurrenceModel) _then) = __$OccurrenceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String schedule, String title,@JsonKey(name: 'due_date') String dueDate,@JsonKey(name: 'due_time') String? dueTime, OccurrenceStatus status,@JsonKey(name: 'completed_at') String? completedAt,@JsonKey(name: 'completed_by') String? completedBy,@JsonKey(name: 'actual_quantity') String? actualQuantity,@JsonKey(name: 'skip_reason') String? skipReason, String? note,@JsonKey(name: 'geotag_lat') double? geotagLat,@JsonKey(name: 'geotag_lng') double? geotagLng, ScheduleUrgency urgency
});




}
/// @nodoc
class __$OccurrenceModelCopyWithImpl<$Res>
    implements _$OccurrenceModelCopyWith<$Res> {
  __$OccurrenceModelCopyWithImpl(this._self, this._then);

  final _OccurrenceModel _self;
  final $Res Function(_OccurrenceModel) _then;

/// Create a copy of OccurrenceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schedule = null,Object? title = null,Object? dueDate = null,Object? dueTime = freezed,Object? status = null,Object? completedAt = freezed,Object? completedBy = freezed,Object? actualQuantity = freezed,Object? skipReason = freezed,Object? note = freezed,Object? geotagLat = freezed,Object? geotagLng = freezed,Object? urgency = null,}) {
  return _then(_OccurrenceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,dueTime: freezed == dueTime ? _self.dueTime : dueTime // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OccurrenceStatus,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,completedBy: freezed == completedBy ? _self.completedBy : completedBy // ignore: cast_nullable_to_non_nullable
as String?,actualQuantity: freezed == actualQuantity ? _self.actualQuantity : actualQuantity // ignore: cast_nullable_to_non_nullable
as String?,skipReason: freezed == skipReason ? _self.skipReason : skipReason // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,geotagLat: freezed == geotagLat ? _self.geotagLat : geotagLat // ignore: cast_nullable_to_non_nullable
as double?,geotagLng: freezed == geotagLng ? _self.geotagLng : geotagLng // ignore: cast_nullable_to_non_nullable
as double?,urgency: null == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as ScheduleUrgency,
  ));
}


}

// dart format on

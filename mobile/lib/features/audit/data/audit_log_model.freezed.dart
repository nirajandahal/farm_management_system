// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditLogModel {

 String get id; String? get actor; String get action; String get category;@JsonKey(name: 'target_model') String get targetModel;@JsonKey(name: 'target_display_name') String get targetDisplayName;@JsonKey(name: 'reference_id') String? get referenceId; String? get description;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of AuditLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditLogModelCopyWith<AuditLogModel> get copyWith => _$AuditLogModelCopyWithImpl<AuditLogModel>(this as AuditLogModel, _$identity);

  /// Serializes this AuditLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AuditLogModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditLogModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.actor, _this.actor) || other.actor == _this.actor)&&(identical(other.action, _this.action) || other.action == _this.action)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.targetModel, _this.targetModel) || other.targetModel == _this.targetModel)&&(identical(other.targetDisplayName, _this.targetDisplayName) || other.targetDisplayName == _this.targetDisplayName)&&(identical(other.referenceId, _this.referenceId) || other.referenceId == _this.referenceId)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AuditLogModel;
  return Object.hash(runtimeType,_this.id,_this.actor,_this.action,_this.category,_this.targetModel,_this.targetDisplayName,_this.referenceId,_this.description,_this.createdAt);
}

@override
String toString() {
  final _this = this as AuditLogModel;
  return 'AuditLogModel(id: ${_this.id}, actor: ${_this.actor}, action: ${_this.action}, category: ${_this.category}, targetModel: ${_this.targetModel}, targetDisplayName: ${_this.targetDisplayName}, referenceId: ${_this.referenceId}, description: ${_this.description}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $AuditLogModelCopyWith<$Res>  {
  factory $AuditLogModelCopyWith(AuditLogModel value, $Res Function(AuditLogModel) _then) = _$AuditLogModelCopyWithImpl;
@useResult
$Res call({
 String id, String? actor, String action, String category,@JsonKey(name: 'target_model') String targetModel,@JsonKey(name: 'target_display_name') String targetDisplayName,@JsonKey(name: 'reference_id') String? referenceId, String? description,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$AuditLogModelCopyWithImpl<$Res>
    implements $AuditLogModelCopyWith<$Res> {
  _$AuditLogModelCopyWithImpl(this._self, this._then);

  final AuditLogModel _self;
  final $Res Function(AuditLogModel) _then;

/// Create a copy of AuditLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? actor = freezed,Object? action = null,Object? category = null,Object? targetModel = null,Object? targetDisplayName = null,Object? referenceId = freezed,Object? description = freezed,Object? createdAt = null,}) {
  return _then(AuditLogModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as String?,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,targetModel: null == targetModel ? _self.targetModel : targetModel // ignore: cast_nullable_to_non_nullable
as String,targetDisplayName: null == targetDisplayName ? _self.targetDisplayName : targetDisplayName // ignore: cast_nullable_to_non_nullable
as String,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditLogModel].
extension AuditLogModelPatterns on AuditLogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditLogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditLogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditLogModel value)  $default,){
final _that = this;
switch (_that) {
case _AuditLogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditLogModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuditLogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? actor,  String action,  String category, @JsonKey(name: 'target_model')  String targetModel, @JsonKey(name: 'target_display_name')  String targetDisplayName, @JsonKey(name: 'reference_id')  String? referenceId,  String? description, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditLogModel() when $default != null:
return $default(_that.id,_that.actor,_that.action,_that.category,_that.targetModel,_that.targetDisplayName,_that.referenceId,_that.description,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? actor,  String action,  String category, @JsonKey(name: 'target_model')  String targetModel, @JsonKey(name: 'target_display_name')  String targetDisplayName, @JsonKey(name: 'reference_id')  String? referenceId,  String? description, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _AuditLogModel():
return $default(_that.id,_that.actor,_that.action,_that.category,_that.targetModel,_that.targetDisplayName,_that.referenceId,_that.description,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? actor,  String action,  String category, @JsonKey(name: 'target_model')  String targetModel, @JsonKey(name: 'target_display_name')  String targetDisplayName, @JsonKey(name: 'reference_id')  String? referenceId,  String? description, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AuditLogModel() when $default != null:
return $default(_that.id,_that.actor,_that.action,_that.category,_that.targetModel,_that.targetDisplayName,_that.referenceId,_that.description,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuditLogModel implements AuditLogModel {
  const _AuditLogModel({required this.id, this.actor, required this.action, required this.category, @JsonKey(name: 'target_model') required this.targetModel, @JsonKey(name: 'target_display_name') required this.targetDisplayName, @JsonKey(name: 'reference_id') this.referenceId, this.description, @JsonKey(name: 'created_at') required this.createdAt});
  factory _AuditLogModel.fromJson(Map<String, dynamic> json) => _$AuditLogModelFromJson(json);

@override final  String id;
@override final  String? actor;
@override final  String action;
@override final  String category;
@override@JsonKey(name: 'target_model') final  String targetModel;
@override@JsonKey(name: 'target_display_name') final  String targetDisplayName;
@override@JsonKey(name: 'reference_id') final  String? referenceId;
@override final  String? description;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of AuditLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditLogModelCopyWith<_AuditLogModel> get copyWith => __$AuditLogModelCopyWithImpl<_AuditLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.action, action) || other.action == action)&&(identical(other.category, category) || other.category == category)&&(identical(other.targetModel, targetModel) || other.targetModel == targetModel)&&(identical(other.targetDisplayName, targetDisplayName) || other.targetDisplayName == targetDisplayName)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,actor,action,category,targetModel,targetDisplayName,referenceId,description,createdAt);
}

@override
String toString() {
    return 'AuditLogModel(id: $id, actor: $actor, action: $action, category: $category, targetModel: $targetModel, targetDisplayName: $targetDisplayName, referenceId: $referenceId, description: $description, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AuditLogModelCopyWith<$Res> implements $AuditLogModelCopyWith<$Res> {
  factory _$AuditLogModelCopyWith(_AuditLogModel value, $Res Function(_AuditLogModel) _then) = __$AuditLogModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? actor, String action, String category,@JsonKey(name: 'target_model') String targetModel,@JsonKey(name: 'target_display_name') String targetDisplayName,@JsonKey(name: 'reference_id') String? referenceId, String? description,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$AuditLogModelCopyWithImpl<$Res>
    implements _$AuditLogModelCopyWith<$Res> {
  __$AuditLogModelCopyWithImpl(this._self, this._then);

  final _AuditLogModel _self;
  final $Res Function(_AuditLogModel) _then;

/// Create a copy of AuditLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? actor = freezed,Object? action = null,Object? category = null,Object? targetModel = null,Object? targetDisplayName = null,Object? referenceId = freezed,Object? description = freezed,Object? createdAt = null,}) {
  return _then(_AuditLogModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as String?,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,targetModel: null == targetModel ? _self.targetModel : targetModel // ignore: cast_nullable_to_non_nullable
as String,targetDisplayName: null == targetDisplayName ? _self.targetDisplayName : targetDisplayName // ignore: cast_nullable_to_non_nullable
as String,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

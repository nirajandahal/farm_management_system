// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  fullName: json['full_name'] as String,
  phone: json['phone'] as String?,
  photoUrl: json['photo_url'] as String?,
  role: json['role'] as String?,
  farm: json['farm'] as String?,
  authProvider: json['auth_provider'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'full_name': instance.fullName,
      'phone': instance.phone,
      'photo_url': instance.photoUrl,
      'role': instance.role,
      'farm': instance.farm,
      'auth_provider': instance.authProvider,
    };

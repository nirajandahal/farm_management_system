import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Mirrors apps/accounts/serializers.py UserSerializer on the backend.
@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    @JsonKey(name: 'full_name') required String fullName,
    String? phone,
    @JsonKey(name: 'photo_url') String? photoUrl,
    String? role,
    String? farm,
    @JsonKey(name: 'auth_provider') String? authProvider,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

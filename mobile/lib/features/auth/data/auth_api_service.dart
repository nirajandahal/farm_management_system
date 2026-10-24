import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import 'user_model.dart';

part 'auth_api_service.g.dart';

class AuthTokens {
  const AuthTokens({required this.access, required this.refresh, required this.user});

  final String access;
  final String refresh;
  final UserModel user;

  factory AuthTokens.fromResponse(Map<String, dynamic> json) => AuthTokens(
        access: json['access'] as String,
        refresh: json['refresh'] as String,
        user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      );
}

class AuthApiService {
  AuthApiService(this._dio);

  final Dio _dio;

  Future<AuthTokens> loginWithGoogle(String idToken) async {
    final response = await _dio.post('/auth/social/google/', data: {'id_token': idToken});
    return AuthTokens.fromResponse(response.data as Map<String, dynamic>);
  }

  Future<AuthTokens> loginWithApple(String idToken) async {
    final response = await _dio.post('/auth/social/apple/', data: {'id_token': idToken});
    return AuthTokens.fromResponse(response.data as Map<String, dynamic>);
  }

  /// DEBUG-only shortcut hitting the backend's DEBUG-gated dev-login
  /// endpoint. The backend itself 404s this outside DEBUG, so calling it
  /// against a production API is a safe no-op, not a security hole -- but
  /// callers should still only surface this path in debug builds.
  Future<AuthTokens> devLogin(String email) async {
    final response = await _dio.post('/auth/dev-login/', data: {'email': email});
    return AuthTokens.fromResponse(response.data as Map<String, dynamic>);
  }

  Future<UserModel> fetchMe() async {
    final response = await _dio.get('/me/');
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }
}

@riverpod
AuthApiService authApiService(Ref ref) => AuthApiService(ref.watch(dioProvider));

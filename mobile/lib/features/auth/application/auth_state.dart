import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  const factory AuthState.authenticated(UserModel user) = AuthStateAuthenticated;
}

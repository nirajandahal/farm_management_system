import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../data/auth_api_service.dart';
import '../data/social_sign_in_service.dart';
import 'auth_state.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<AuthState> build() async {
    final tokenStorage = ref.watch(secureTokenStorageProvider);
    final accessToken = await tokenStorage.readAccessToken();
    if (accessToken == null) {
      return const AuthState.unauthenticated();
    }

    // A stored token might be expired/invalid (e.g. server DB was reset
    // since it was issued) -- validate it by actually fetching the profile
    // rather than trusting its mere presence.
    try {
      final user = await ref.read(authApiServiceProvider).fetchMe();
      return AuthState.authenticated(user);
    } catch (_) {
      await tokenStorage.clear();
      return const AuthState.unauthenticated();
    }
  }

  Future<void> loginWithGoogle() async {
    final idToken = await SocialSignInService().signInWithGoogle();
    final tokens = await ref.read(authApiServiceProvider).loginWithGoogle(idToken);
    await _persistAndSetState(tokens);
  }

  Future<void> loginWithApple() async {
    final idToken = await SocialSignInService().signInWithApple();
    final tokens = await ref.read(authApiServiceProvider).loginWithApple(idToken);
    await _persistAndSetState(tokens);
  }

  /// Debug-only login path -- see AuthApiService.devLogin and the backend's
  /// DevLoginView for why this is safe to ship (it 404s outside DEBUG).
  Future<void> devLogin(String email) async {
    final tokens = await ref.read(authApiServiceProvider).devLogin(email);
    await _persistAndSetState(tokens);
  }

  Future<void> logout() async {
    await ref.read(secureTokenStorageProvider).clear();
    state = const AsyncData(AuthState.unauthenticated());
  }

  Future<void> _persistAndSetState(AuthTokens tokens) async {
    await ref.read(secureTokenStorageProvider).saveTokens(
          access: tokens.access,
          refresh: tokens.refresh,
        );
    state = AsyncData(AuthState.authenticated(tokens.user));
  }
}

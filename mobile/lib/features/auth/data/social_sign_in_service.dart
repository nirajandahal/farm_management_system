import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Thin wrapper around the native Google/Apple SDKs -- the part that gets
/// an identity token to hand to the backend's /auth/social/*/ endpoints.
///
/// NOTE: this cannot be exercised until real OAuth client credentials are
/// configured (Google Cloud Console client ID + platform config files;
/// Apple Service ID + domain verification for web). Until then, calling
/// these will throw -- that's expected, not a bug. The dev-login path is
/// how the rest of the login flow gets verified in the meantime.
class SocialSignInService {
  Future<String> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize();
    final account = await googleSignIn.authenticate();
    final idToken = account.authentication.idToken;
    if (idToken == null) {
      throw StateError('Google sign-in did not return an ID token.');
    }
    return idToken;
  }

  Future<String> signInWithApple() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName],
    );
    final idToken = credential.identityToken;
    if (idToken == null) {
      throw StateError('Apple sign-in did not return an identity token.');
    }
    return idToken;
  }
}

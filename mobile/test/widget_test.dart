import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:farmloop/app.dart';
import 'package:farmloop/features/auth/application/auth_controller.dart';
import 'package:farmloop/features/auth/application/auth_state.dart';

/// Overrides the real controller (which does live network/storage I/O in
/// its build()) so this test is fast and isolated, not an integration test
/// against a running backend.
class _FakeUnauthenticatedController extends AuthController {
  @override
  Future<AuthState> build() async => const AuthState.unauthenticated();
}

void main() {
  testWidgets('Shows the login screen when unauthenticated', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authControllerProvider.overrideWith(_FakeUnauthenticatedController.new),
        ],
        child: const FarmloopApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Farmloop'), findsOneWidget);
    expect(find.text('Continue with Google'), findsOneWidget);
  });
}

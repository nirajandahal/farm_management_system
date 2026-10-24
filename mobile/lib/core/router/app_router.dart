import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/application/auth_controller.dart';
import '../../features/auth/application/auth_state.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/inventory/presentation/inventory_detail_screen.dart';
import '../../features/inventory/presentation/living_inventory_screen.dart';
import '../../features/schedules/presentation/home_screen.dart';
import '../../features/supplies/presentation/supplies_screen.dart';
import '../../features/supplies/presentation/supply_detail_screen.dart';
import '../../features/team/presentation/team_audit_screen.dart';
import 'app_shell.dart';

part 'app_router.g.dart';

/// Bridges Riverpod's async auth state to go_router's Listenable-based
/// refresh mechanism -- notifies go_router to re-run `redirect` whenever
/// auth state changes, without recreating the GoRouter instance itself.
class _AuthRefreshListenable extends ChangeNotifier {
  _AuthRefreshListenable(Ref ref) {
    ref.listen(authControllerProvider, (_, _) => notifyListeners());
  }
}

@riverpod
GoRouter appRouter(Ref ref) {
  final authRefreshListenable = _AuthRefreshListenable(ref);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: authRefreshListenable,
    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);
      final isLoggingIn = state.matchedLocation == '/login';

      return authState.when(
        data: (auth) {
          final isAuthenticated = auth is AuthStateAuthenticated;
          if (!isAuthenticated && !isLoggingIn) return '/login';
          if (isAuthenticated && isLoggingIn) return '/';

          // Defense in depth: the nav bar already hides Team from
          // Farmhands, but a direct/deep link shouldn't reach it either --
          // matches the backend's own IsFarmAdmin gate on these endpoints.
          if (auth is AuthStateAuthenticated &&
              state.matchedLocation.startsWith('/team') &&
              auth.user.role != 'ADMIN') {
            return '/';
          }
          return null;
        },
        loading: () => null,
        error: (_, _) => isLoggingIn ? null : '/login',
      );
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/inventory',
              builder: (context, state) => const LivingInventoryScreen(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) => InventoryDetailScreen(itemId: state.pathParameters['id']!),
                ),
              ],
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/supplies',
              builder: (context, state) => const SuppliesScreen(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) => SupplyDetailScreen(supplyId: state.pathParameters['id']!),
                ),
              ],
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/team', builder: (context, state) => const TeamAuditScreen()),
          ]),
        ],
      ),
    ],
  );
}

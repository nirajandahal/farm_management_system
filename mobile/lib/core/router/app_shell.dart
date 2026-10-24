import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/application/auth_controller.dart';
import '../../features/auth/application/auth_state.dart';

/// Bottom-nav shell. Team is always the last branch in the router, but
/// only shown here for Admins -- Farmhands never see it, matching the
/// backend's own IsFarmAdmin gate on those endpoints. Since it's always
/// last, slicing the destination list doesn't disturb the index mapping
/// for the tabs Farmhands do see.
class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final isAdmin = switch (authState.value) {
      AuthStateAuthenticated(:final user) => user.role == 'ADMIN',
      _ => false,
    };

    final destinations = [
      const NavigationDestination(icon: Icon(Icons.checklist_outlined), selectedIcon: Icon(Icons.checklist), label: 'Triage'),
      const NavigationDestination(icon: Icon(Icons.pets_outlined), selectedIcon: Icon(Icons.pets), label: 'Inventory'),
      const NavigationDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2), label: 'Supplies'),
      if (isAdmin)
        const NavigationDestination(icon: Icon(Icons.groups_outlined), selectedIcon: Icon(Icons.groups), label: 'Team'),
    ];

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: destinations,
      ),
    );
  }
}

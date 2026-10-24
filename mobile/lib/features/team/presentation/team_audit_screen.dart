import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../audit/presentation/audit_tab.dart';
import '../../auth/data/user_model.dart';
import '../application/team_providers.dart';
import 'team_tab.dart';

class TeamAuditScreen extends ConsumerWidget {
  const TeamAuditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamAsync = ref.watch(teamListProvider);
    final teamById = <String, UserModel>{
      for (final member in teamAsync.value ?? <UserModel>[]) member.id: member,
    };

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Team'),
          bottom: const TabBar(tabs: [Tab(text: 'Members'), Tab(text: 'Activity')]),
        ),
        body: TabBarView(
          children: [
            const TeamTab(),
            AuditTab(teamById: teamById),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../../auth/application/auth_controller.dart';
import '../../auth/application/auth_state.dart';
import '../../auth/data/user_model.dart';
import '../application/team_providers.dart';

class TeamTab extends ConsumerWidget {
  const TeamTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamAsync = ref.watch(teamListProvider);
    final authState = ref.watch(authControllerProvider);
    final currentUserId = switch (authState.value) {
      AuthStateAuthenticated(:final user) => user.id,
      _ => null,
    };

    return Scaffold(
      body: teamAsync.when(
        data: (members) {
          if (members.isEmpty) {
            return Center(
              child: Text('No team members yet', style: Theme.of(context).textTheme.bodyMedium),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.refresh(teamListProvider.future),
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 80),
              itemCount: members.length,
              itemBuilder: (context, index) {
                final member = members[index];
                return _MemberTile(
                  member: member,
                  isSelf: member.id == currentUserId,
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text('Could not load: $err', textAlign: TextAlign.center),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showInviteDialog(context, ref),
        icon: const Icon(Icons.person_add_outlined),
        label: const Text('Invite'),
      ),
    );
  }

  static void _showInviteDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Invite Farmhand'),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(labelText: 'Email address'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text('Cancel')),
          FilledButton(
            onPressed: () async {
              final email = controller.text.trim();
              if (email.isEmpty) return;
              try {
                await ref.read(teamActionsControllerProvider.notifier).invite(email);
              } catch (e) {
                if (dialogContext.mounted) {
                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    SnackBar(content: Text('Could not invite: $e')),
                  );
                }
              }
              if (dialogContext.mounted) Navigator.of(dialogContext).pop();
            },
            child: const Text('Invite'),
          ),
        ],
      ),
    );
  }
}

class _MemberTile extends ConsumerWidget {
  const _MemberTile({required this.member, required this.isSelf});

  final UserModel member;
  final bool isSelf;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        title: Text(member.fullName.isNotEmpty ? member.fullName : member.email),
        subtitle: Text(member.email),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _RoleBadge(role: member.role ?? 'FARMHAND'),
            if (!isSelf) ...[
              const SizedBox(width: 4),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () => _showActionsSheet(context, ref),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showActionsSheet(BuildContext context, WidgetRef ref) {
    final isAdmin = member.role == 'ADMIN';
    showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(isAdmin ? Icons.arrow_downward : Icons.arrow_upward),
              title: Text(isAdmin ? 'Demote to Farmhand' : 'Promote to Admin'),
              onTap: () async {
                Navigator.of(sheetContext).pop();
                await ref
                    .read(teamActionsControllerProvider.notifier)
                    .changeRole(member.id, isAdmin ? 'FARMHAND' : 'ADMIN');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_remove_outlined, color: AppColors.urgent),
              title: const Text('Remove from farm', style: TextStyle(color: AppColors.urgent)),
              onTap: () async {
                Navigator.of(sheetContext).pop();
                await ref.read(teamActionsControllerProvider.notifier).remove(member.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _RoleBadge extends StatelessWidget {
  const _RoleBadge({required this.role});

  final String role;

  @override
  Widget build(BuildContext context) {
    final isAdmin = role == 'ADMIN';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: (isAdmin ? AppColors.primary : AppColors.routine).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isAdmin ? 'Admin' : 'Farmhand',
        style: TextStyle(
          color: isAdmin ? AppColors.primary : AppColors.textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

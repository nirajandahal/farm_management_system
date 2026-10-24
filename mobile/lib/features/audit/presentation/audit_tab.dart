import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../../auth/data/user_model.dart';
import '../application/audit_providers.dart';
import '../data/audit_log_model.dart';

class AuditTab extends ConsumerWidget {
  const AuditTab({super.key, required this.teamById});

  /// Actor-ID -> member lookup, built by the parent from the Team tab's
  /// data so this doesn't need its own network round trip or a backend
  /// change to expand `actor` into a name.
  final Map<String, UserModel> teamById;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logAsync = ref.watch(auditLogProvider);

    return logAsync.when(
      data: (entries) {
        if (entries.isEmpty) {
          return Center(
            child: Text('No activity yet', style: Theme.of(context).textTheme.bodyMedium),
          );
        }
        return RefreshIndicator(
          onRefresh: () => ref.refresh(auditLogProvider.future),
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            itemCount: entries.length,
            itemBuilder: (context, index) => _AuditTile(
              entry: entries[index],
              actorName: teamById[entries[index].actor]?.fullName,
            ),
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
    );
  }
}

class _AuditTile extends StatelessWidget {
  const _AuditTile({required this.entry, required this.actorName});

  final AuditLogModel entry;
  final String? actorName;

  @override
  Widget build(BuildContext context) {
    final parts = <String>[
      ?actorName,
      _formatDate(entry.createdAt),
      if (entry.referenceId?.isNotEmpty == true) entry.referenceId!,
    ];

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _CategoryChip(category: entry.category),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    entry.targetDisplayName,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            if (entry.description?.isNotEmpty == true) ...[
              const SizedBox(height: 6),
              Text(entry.description!, style: Theme.of(context).textTheme.bodyMedium),
            ],
            const SizedBox(height: 6),
            Text(parts.join(' · '), style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }

  static String _formatDate(String isoDateTime) {
    final date = DateTime.tryParse(isoDateTime);
    if (date == null) return isoDateTime;
    final local = date.toLocal();
    final hour12 = local.hour % 12 == 0 ? 12 : local.hour % 12;
    final period = local.hour >= 12 ? 'PM' : 'AM';
    final minute = local.minute.toString().padLeft(2, '0');
    return '${local.year}-${local.month.toString().padLeft(2, '0')}-${local.day.toString().padLeft(2, '0')} '
        '$hour12:$minute $period';
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    final color = switch (category) {
      'HEALTH' => AppColors.urgent,
      'SUPPLY' => AppColors.primaryLight,
      'SCHEDULE' => AppColors.success,
      'TEAM' => AppColors.routine,
      _ => AppColors.textSecondary,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        category,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }
}

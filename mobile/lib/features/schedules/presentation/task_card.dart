import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../application/today_occurrences_controller.dart';
import '../data/occurrence_model.dart';

/// Swipe right = done, swipe left = skip -- no confirmation dialog, per the
/// glove-friendly / minimal-interaction design this screen was built for.
/// Each action shows an "Undo" toast instead of asking "are you sure?"
/// beforehand.
class TaskCard extends ConsumerWidget {
  const TaskCard({super.key, required this.occurrence});

  final OccurrenceModel occurrence;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(todayOccurrencesControllerProvider.notifier);

    return Dismissible(
      key: ValueKey(occurrence.id),
      background: _SwipeBackground(
        alignment: Alignment.centerLeft,
        color: AppColors.success,
        icon: Icons.check_circle_outline,
        label: 'Done',
      ),
      secondaryBackground: _SwipeBackground(
        alignment: Alignment.centerRight,
        color: AppColors.routine,
        icon: Icons.redo_rounded,
        label: 'Skip',
      ),
      onDismissed: (direction) {
        final messenger = ScaffoldMessenger.of(context);
        final isComplete = direction == DismissDirection.startToEnd;
        if (isComplete) {
          controller.completeWithUndo(occurrence.id);
        } else {
          controller.skipWithUndo(occurrence.id);
        }
        messenger.showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 4),
            content: Text(isComplete ? '"${occurrence.title}" marked done' : '"${occurrence.title}" skipped'),
            action: SnackBarAction(label: 'Undo', onPressed: () => controller.undo(occurrence.id)),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              _UrgencyDot(urgency: occurrence.urgency),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(occurrence.title, style: Theme.of(context).textTheme.titleMedium),
                    if (occurrence.dueTime != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        _formatTime(occurrence.dueTime!),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _formatTime(String hhmmss) {
    final parts = hhmmss.split(':');
    final hour24 = int.parse(parts[0]);
    final minute = parts[1];
    final period = hour24 >= 12 ? 'PM' : 'AM';
    final hour12 = hour24 % 12 == 0 ? 12 : hour24 % 12;
    return '$hour12:$minute $period';
  }
}

class _UrgencyDot extends StatelessWidget {
  const _UrgencyDot({required this.urgency});

  final ScheduleUrgency urgency;

  @override
  Widget build(BuildContext context) {
    final color = switch (urgency) {
      ScheduleUrgency.urgent => AppColors.urgent,
      ScheduleUrgency.routine => AppColors.routine,
      ScheduleUrgency.admin => AppColors.primaryLight,
    };
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _SwipeBackground extends StatelessWidget {
  const _SwipeBackground({
    required this.alignment,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Alignment alignment;
  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (alignment == Alignment.centerRight) ...[
            Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
          ],
          Icon(icon, color: Colors.white),
          if (alignment == Alignment.centerLeft) ...[
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ],
      ),
    );
  }
}

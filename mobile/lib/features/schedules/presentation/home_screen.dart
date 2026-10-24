import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../../auth/application/auth_controller.dart';
import '../application/today_occurrences_controller.dart';
import '../data/occurrence_model.dart';
import 'task_card.dart';

enum _TimeBucket { morning, afternoon, evening }

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final occurrencesAsync = ref.watch(todayOccurrencesControllerProvider);

    return DefaultTabController(
      length: 3,
      initialIndex: _currentBucket().index,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Farmloop'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => ref.read(authControllerProvider.notifier).logout(),
            ),
          ],
          bottom: const TabBar(
            tabs: [Tab(text: 'Morning'), Tab(text: 'Afternoon'), Tab(text: 'Evening')],
          ),
        ),
        body: occurrencesAsync.when(
          data: (occurrences) => _TodayView(occurrences: occurrences),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => _ErrorView(
            message: '$err',
            onRetry: () => ref.read(todayOccurrencesControllerProvider.notifier).refresh(),
          ),
        ),
      ),
    );
  }

  static _TimeBucket _currentBucket() {
    final hour = DateTime.now().hour;
    if (hour < 12) return _TimeBucket.morning;
    if (hour < 17) return _TimeBucket.afternoon;
    return _TimeBucket.evening;
  }
}

class _TodayView extends ConsumerWidget {
  const _TodayView({required this.occurrences});

  final List<OccurrenceModel> occurrences;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Progress counts every task for today regardless of status, but only
    // PENDING ones render as swipeable cards -- a completed/skipped task
    // should disappear from view without its count vanishing from "today's
    // progress" too.
    final completed = occurrences.where((o) => o.status == OccurrenceStatus.completed).length;
    final buckets = {
      _TimeBucket.morning: <OccurrenceModel>[],
      _TimeBucket.afternoon: <OccurrenceModel>[],
      _TimeBucket.evening: <OccurrenceModel>[],
    };
    for (final occurrence in occurrences) {
      if (occurrence.status != OccurrenceStatus.pending) continue;
      buckets[_bucketFor(occurrence)]!.add(occurrence);
    }

    return Column(
      children: [
        _ProgressHeader(completed: completed, total: occurrences.length),
        Expanded(
          child: TabBarView(
            children: [
              _BucketList(occurrences: buckets[_TimeBucket.morning]!),
              _BucketList(occurrences: buckets[_TimeBucket.afternoon]!),
              _BucketList(occurrences: buckets[_TimeBucket.evening]!),
            ],
          ),
        ),
      ],
    );
  }

  static _TimeBucket _bucketFor(OccurrenceModel occurrence) {
    final dueTime = occurrence.dueTime;
    if (dueTime == null) return _TimeBucket.morning; // undated tasks default to Morning
    final hour = int.parse(dueTime.split(':')[0]);
    if (hour < 12) return _TimeBucket.morning;
    if (hour < 17) return _TimeBucket.afternoon;
    return _TimeBucket.evening;
  }
}

class _ProgressHeader extends StatelessWidget {
  const _ProgressHeader({required this.completed, required this.total});

  final int completed;
  final int total;

  @override
  Widget build(BuildContext context) {
    final progress = total == 0 ? 0.0 : completed / total;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Today's Progress", style: Theme.of(context).textTheme.titleMedium),
              Text(
                '$completed/$total',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.success),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.background,
              valueColor: const AlwaysStoppedAnimation(AppColors.success),
            ),
          ),
        ],
      ),
    );
  }
}

class _BucketList extends StatelessWidget {
  const _BucketList({required this.occurrences});

  final List<OccurrenceModel> occurrences;

  @override
  Widget build(BuildContext context) {
    if (occurrences.isEmpty) {
      return Center(
        child: Text('Nothing here', style: Theme.of(context).textTheme.bodyMedium),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: occurrences.length,
      itemBuilder: (context, index) => TaskCard(occurrence: occurrences[index]),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Could not load tasks', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(message, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}

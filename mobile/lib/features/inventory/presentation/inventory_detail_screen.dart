import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../application/inventory_providers.dart';
import '../data/living_inventory_item_model.dart';
import '../data/log_entry_models.dart';

class InventoryDetailScreen extends ConsumerWidget {
  const InventoryDetailScreen({super.key, required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemAsync = ref.watch(inventoryDetailProvider(itemId));

    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: itemAsync.when(
        data: (item) => _DetailBody(item: item),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Could not load: $err')),
      ),
    );
  }
}

class _DetailBody extends ConsumerWidget {
  const _DetailBody({required this.item});

  final LivingInventoryItemModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(item.name, style: Theme.of(context).textTheme.headlineSmall),
        if (item.speciesOrVariety != null) ...[
          const SizedBox(height: 4),
          Text(item.speciesOrVariety!, style: Theme.of(context).textTheme.bodyMedium),
        ],
        const SizedBox(height: 16),
        _StatRow(item: item),
        const SizedBox(height: 24),
        _DomainDetailSection(item: item),
        const SizedBox(height: 24),
        _SectionHeader(title: 'Health History'),
        _HealthLogList(itemId: item.id),
        const SizedBox(height: 24),
        _SectionHeader(title: 'Production'),
        _ProductionLogList(itemId: item.id),
        if (item.domainType == DomainType.animal) ...[
          const SizedBox(height: 24),
          _SectionHeader(title: 'Breeding & Lifecycle'),
          _BreedingLogList(itemId: item.id),
        ],
      ],
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.item});

  final LivingInventoryItemModel item;

  @override
  Widget build(BuildContext context) {
    final healthColor = switch (item.healthStatus) {
      HealthStatus.healthy => AppColors.success,
      HealthStatus.monitoring => AppColors.routine,
      HealthStatus.critical => AppColors.urgent,
    };
    final healthLabel = switch (item.healthStatus) {
      HealthStatus.healthy => 'Healthy',
      HealthStatus.monitoring => 'Monitoring',
      HealthStatus.critical => 'Critical',
    };
    return Row(
      children: [
        Expanded(child: _Stat(label: 'Quantity', value: '${item.quantity}')),
        Expanded(
          child: _Stat(label: 'Health', value: healthLabel, valueColor: healthColor),
        ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value, this.valueColor});

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 2),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: valueColor),
        ),
      ],
    );
  }
}

class _DomainDetailSection extends StatelessWidget {
  const _DomainDetailSection({required this.item});

  final LivingInventoryItemModel item;

  @override
  Widget build(BuildContext context) {
    final rows = switch (item.domainType) {
      DomainType.animal => {
          'Breed': item.breed,
          'Avg. Weight': item.avgWeight != null ? '${item.avgWeight} kg' : null,
          'Breeding Status': item.breedingStatus,
        },
      DomainType.crop => {
          'Growth Stage': item.growthStage,
          'Planting Date': item.plantingDate,
          'Expected Harvest': item.expectedHarvestDate,
        },
      DomainType.fish => {
          'Target Water Temp': item.targetWaterTemp != null ? '${item.targetWaterTemp} °C' : null,
          'Target pH': item.targetPh,
        },
      DomainType.fungi => {
          'Substrate': item.substrateType,
          'Target Humidity': item.targetHumidity != null ? '${item.targetHumidity}%' : null,
        },
    }..removeWhere((_, value) => value == null || value.isEmpty);

    if (rows.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final entry in rows.entries) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(entry.key, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      entry.value!,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class _HealthLogList extends ConsumerWidget {
  const _HealthLogList({required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(healthLogsProvider(itemId));
    return logsAsync.when(
      data: (logs) {
        if (logs.isEmpty) return const _EmptyLogNote(text: 'No health entries yet');
        return Column(
          children: [
            for (final log in logs)
              _LogTile(
                leading: _severityDot(log.severity),
                title: log.issueDescription?.isNotEmpty == true ? log.issueDescription! : 'Checkup',
                subtitle: [
                  if (log.doctorName?.isNotEmpty == true) log.doctorName!,
                  _formatDate(log.createdAt),
                ].join(' · '),
              ),
          ],
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) => Text('Could not load: $err'),
    );
  }

  static Widget _severityDot(HealthSeverity severity) {
    final color = switch (severity) {
      HealthSeverity.critical => AppColors.urgent,
      HealthSeverity.moderate => AppColors.primaryLight,
      HealthSeverity.routine => AppColors.routine,
    };
    return Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle));
  }
}

class _ProductionLogList extends ConsumerWidget {
  const _ProductionLogList({required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(productionLogsProvider(itemId));
    return logsAsync.when(
      data: (logs) {
        if (logs.isEmpty) return const _EmptyLogNote(text: 'No production entries yet');
        return Column(
          children: [
            for (final log in logs)
              _LogTile(
                leading: const Icon(Icons.trending_up, color: AppColors.success, size: 20),
                title: '${log.value} ${log.unit} · ${_metricLabel(log.metricType)}',
                subtitle: [
                  if (log.individualIdTag?.isNotEmpty == true) log.individualIdTag!,
                  _formatDate(log.createdAt),
                ].join(' · '),
              ),
          ],
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) => Text('Could not load: $err'),
    );
  }

  static String _metricLabel(String metricType) => metricType
      .split('_')
      .map((w) => w.isEmpty ? w : '${w[0]}${w.substring(1).toLowerCase()}')
      .join(' ');
}

class _BreedingLogList extends ConsumerWidget {
  const _BreedingLogList({required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(breedingLogsProvider(itemId));
    return logsAsync.when(
      data: (logs) {
        if (logs.isEmpty) return const _EmptyLogNote(text: 'No breeding entries yet');
        return Column(
          children: [
            for (final log in logs)
              _LogTile(
                leading: const Icon(Icons.favorite_outline, color: AppColors.primaryLight, size: 20),
                title: [
                  if (log.individualIdTag?.isNotEmpty == true) log.individualIdTag!,
                  log.breedingStatus,
                ].join(' · '),
                subtitle: log.expectedDeliveryDate != null
                    ? 'Expected: ${log.expectedDeliveryDate}'
                    : (log.lastMatingDate != null ? 'Last mating: ${log.lastMatingDate}' : ''),
              ),
          ],
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) => Text('Could not load: $err'),
    );
  }
}

class _LogTile extends StatelessWidget {
  const _LogTile({required this.leading, required this.title, required this.subtitle});

  final Widget leading;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: leading,
        title: Text(title),
        subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      ),
    );
  }
}

class _EmptyLogNote extends StatelessWidget {
  const _EmptyLogNote({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}

String _formatDate(String isoDateTime) {
  final date = DateTime.tryParse(isoDateTime);
  if (date == null) return isoDateTime;
  return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}

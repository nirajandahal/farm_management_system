import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../application/supplies_providers.dart';
import '../data/consumption_log_model.dart';
import '../data/supply_forecast_model.dart';
import '../data/supply_model.dart';

class SupplyDetailScreen extends ConsumerWidget {
  const SupplyDetailScreen({super.key, required this.supplyId});

  final String supplyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supplyAsync = ref.watch(supplyDetailProvider(supplyId));

    return Scaffold(
      appBar: AppBar(title: const Text('Supply Details')),
      body: supplyAsync.when(
        data: (supply) => _DetailBody(supply: supply),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Could not load: $err')),
      ),
    );
  }
}

class _DetailBody extends ConsumerWidget {
  const _DetailBody({required this.supply});

  final SupplyModel supply;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fraction = supply.stockFraction;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(supply.name, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 4),
        Text(_categoryLabel(supply.category), style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Current Stock', style: Theme.of(context).textTheme.bodyMedium),
                    Text(
                      '${supply.currentStock}${supply.totalCapacity != null ? ' / ${supply.totalCapacity}' : ''} ${_unitLabel(supply.unit)}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: fraction ?? 0,
                    minHeight: 8,
                    backgroundColor: AppColors.background,
                    valueColor: AlwaysStoppedAnimation(_stockColor(fraction)),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        _ForecastCard(supplyId: supply.id),
        const SizedBox(height: 16),
        _StorageInfoCard(supply: supply),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _showRestockDialog(context, ref, supply.id),
                child: const Text('Restock'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: () => _showCorrectStockDialog(context, ref, supply.id),
                child: const Text('Correct Stock'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text('Recent Activity', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        _ConsumptionHistoryList(supplyId: supply.id),
      ],
    );
  }

  static Color _stockColor(double? fraction) {
    if (fraction == null) return AppColors.routine;
    if (fraction < 0.2) return AppColors.urgent;
    if (fraction < 0.5) return AppColors.primaryLight;
    return AppColors.success;
  }

  static String _categoryLabel(SupplyCategory category) => switch (category) {
        SupplyCategory.animalFeed => 'Animal Feed',
        SupplyCategory.fertilizer => 'Fertilizer',
        SupplyCategory.medicine => 'Medicine',
        SupplyCategory.seed => 'Seed',
        SupplyCategory.other => 'Other',
      };

  static String _unitLabel(SupplyUnit unit) => switch (unit) {
        SupplyUnit.kg => 'kg',
        SupplyUnit.liters => 'L',
        SupplyUnit.packets => 'packets',
        SupplyUnit.units => 'units',
        SupplyUnit.other => '',
      };

  static void _showRestockDialog(BuildContext context, WidgetRef ref, String supplyId) {
    _showQuantityDialog(
      context: context,
      title: 'Restock',
      label: 'Quantity to add',
      onSubmit: (value) => ref.read(supplyActionsControllerProvider.notifier).restock(supplyId, value),
    );
  }

  static void _showCorrectStockDialog(BuildContext context, WidgetRef ref, String supplyId) {
    _showQuantityDialog(
      context: context,
      title: 'Correct Stock',
      label: 'Actual current stock',
      onSubmit: (value) => ref.read(supplyActionsControllerProvider.notifier).correctStock(supplyId, value),
    );
  }

  static void _showQuantityDialog({
    required BuildContext context,
    required String title,
    required String label,
    required Future<void> Function(String value) onSubmit,
  }) {
    final controller = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(labelText: label),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text('Cancel')),
          FilledButton(
            onPressed: () async {
              final value = controller.text.trim();
              if (value.isEmpty) return;
              await onSubmit(value);
              if (dialogContext.mounted) Navigator.of(dialogContext).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class _ForecastCard extends ConsumerWidget {
  const _ForecastCard({required this.supplyId});

  final String supplyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastAsync = ref.watch(supplyForecastProvider(supplyId));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: forecastAsync.when(
          data: (result) => switch (result) {
            ForecastAvailable(:final forecast) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Forecast', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  if (forecast.predictedEmptyDate != null)
                    Text('Predicted empty: ${forecast.predictedEmptyDate}'),
                  if (forecast.dailyUsageRate != null)
                    Text('Daily usage: ${forecast.dailyUsageRate} / day'),
                ],
              ),
            ForecastNotComputed() => Text(
                'Forecast not available yet — keep logging usage and it\'ll appear here.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ForecastNotAllowed() => Row(
                children: [
                  const Icon(Icons.lock_outline, size: 18, color: AppColors.textSecondary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Forecasting is a paid-tier feature. Upgrade to see predicted stock-out dates.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Text('Could not load forecast: $err'),
        ),
      ),
    );
  }
}

class _StorageInfoCard extends StatelessWidget {
  const _StorageInfoCard({required this.supply});

  final SupplyModel supply;

  @override
  Widget build(BuildContext context) {
    final rows = {
      'Batch Number': supply.batchNumber,
      'Expiry Date': supply.expiryDate,
      'Reorder Threshold': supply.reorderThresholdDays != null ? '${supply.reorderThresholdDays} days before empty' : null,
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

class _ConsumptionHistoryList extends ConsumerWidget {
  const _ConsumptionHistoryList({required this.supplyId});

  final String supplyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(supplyConsumptionHistoryProvider(supplyId));

    return logsAsync.when(
      data: (logs) {
        if (logs.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('No activity yet', style: Theme.of(context).textTheme.bodyMedium),
          );
        }
        return Column(
          children: [
            for (final log in logs)
              Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: _adjustmentIcon(log.adjustmentType),
                  title: Text('${log.actualQuantity} · ${_adjustmentLabel(log.adjustmentType)}'),
                  subtitle: Text(_formatDate(log.createdAt)),
                ),
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

  static Widget _adjustmentIcon(AdjustmentType type) => switch (type) {
        AdjustmentType.taskCompletion => const Icon(Icons.check_circle_outline, color: AppColors.success, size: 20),
        AdjustmentType.manualUpdate => const Icon(Icons.edit_outlined, color: AppColors.primaryLight, size: 20),
        AdjustmentType.restock => const Icon(Icons.add_box_outlined, color: AppColors.success, size: 20),
      };

  static String _adjustmentLabel(AdjustmentType type) => switch (type) {
        AdjustmentType.taskCompletion => 'Used (task)',
        AdjustmentType.manualUpdate => 'Corrected',
        AdjustmentType.restock => 'Restocked',
      };

  static String _formatDate(String isoDateTime) {
    final date = DateTime.tryParse(isoDateTime);
    if (date == null) return isoDateTime;
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

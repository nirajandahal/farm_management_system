import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../data/living_inventory_item_model.dart';

class InventoryItemCard extends StatelessWidget {
  const InventoryItemCard({super.key, required this.item, required this.onTap});

  final LivingInventoryItemModel item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              _HealthBadge(status: item.healthStatus),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(_subtitle(), style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }

  String _subtitle() {
    final parts = <String>[
      if (item.speciesOrVariety != null && item.speciesOrVariety!.isNotEmpty) item.speciesOrVariety!,
      '${item.quantity} ${item.quantity == 1 ? 'unit' : 'units'}',
    ];
    return parts.join(' · ');
  }
}

class _HealthBadge extends StatelessWidget {
  const _HealthBadge({required this.status});

  final HealthStatus status;

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      HealthStatus.healthy => AppColors.success,
      HealthStatus.monitoring => AppColors.routine,
      HealthStatus.critical => AppColors.urgent,
    };
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

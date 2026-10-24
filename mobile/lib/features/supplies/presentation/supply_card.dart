import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../data/supply_model.dart';

class SupplyCard extends StatelessWidget {
  const SupplyCard({super.key, required this.supply, required this.onTap});

  final SupplyModel supply;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final fraction = supply.stockFraction;
    final barColor = _colorFor(fraction);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(supply.name, style: Theme.of(context).textTheme.titleMedium)),
                  Text(
                    '${supply.currentStock} ${_unitLabel(supply.unit)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: fraction ?? 0,
                  minHeight: 6,
                  backgroundColor: AppColors.background,
                  valueColor: AlwaysStoppedAnimation(barColor),
                ),
              ),
              if (fraction != null) ...[
                const SizedBox(height: 4),
                Text('${(fraction * 100).round()}% of capacity', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ],
          ),
        ),
      ),
    );
  }

  static Color _colorFor(double? fraction) {
    if (fraction == null) return AppColors.routine;
    if (fraction < 0.2) return AppColors.urgent;
    if (fraction < 0.5) return AppColors.primaryLight;
    return AppColors.success;
  }

  static String _unitLabel(SupplyUnit unit) => switch (unit) {
        SupplyUnit.kg => 'kg',
        SupplyUnit.liters => 'L',
        SupplyUnit.packets => 'pkts',
        SupplyUnit.units => 'units',
        SupplyUnit.other => '',
      };
}

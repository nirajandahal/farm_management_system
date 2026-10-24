import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/supplies_providers.dart';
import 'supply_card.dart';

class SuppliesScreen extends ConsumerWidget {
  const SuppliesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suppliesAsync = ref.watch(suppliesListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Supplies')),
      body: suppliesAsync.when(
        data: (supplies) {
          if (supplies.isEmpty) {
            return Center(
              child: Text('No supplies yet', style: Theme.of(context).textTheme.bodyMedium),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.refresh(suppliesListProvider.future),
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              itemCount: supplies.length,
              itemBuilder: (context, index) => SupplyCard(
                supply: supplies[index],
                onTap: () => context.push('/supplies/${supplies[index].id}'),
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
      ),
    );
  }
}

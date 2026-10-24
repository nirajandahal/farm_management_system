import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/inventory_providers.dart';
import '../data/living_inventory_item_model.dart';
import 'inventory_item_card.dart';

class LivingInventoryScreen extends StatelessWidget {
  const LivingInventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Living Inventory'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Animals'),
              Tab(text: 'Plants'),
              Tab(text: 'Fish'),
              Tab(text: 'Fungi'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _DomainList(domainType: DomainType.animal),
            _DomainList(domainType: DomainType.crop),
            _DomainList(domainType: DomainType.fish),
            _DomainList(domainType: DomainType.fungi),
          ],
        ),
      ),
    );
  }
}

class _DomainList extends ConsumerWidget {
  const _DomainList({required this.domainType});

  final DomainType domainType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(inventoryByDomainProvider(domainType));

    return itemsAsync.when(
      data: (items) {
        if (items.isEmpty) {
          return Center(
            child: Text('No entries yet', style: Theme.of(context).textTheme.bodyMedium),
          );
        }
        return RefreshIndicator(
          onRefresh: () => ref.refresh(inventoryByDomainProvider(domainType).future),
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            itemCount: items.length,
            itemBuilder: (context, index) => InventoryItemCard(
              item: items[index],
              onTap: () => context.push('/inventory/${items[index].id}'),
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

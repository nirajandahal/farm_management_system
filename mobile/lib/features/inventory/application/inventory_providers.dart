import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/living_inventory_api_service.dart';
import '../data/living_inventory_item_model.dart';
import '../data/log_entry_models.dart';

part 'inventory_providers.g.dart';

@riverpod
Future<List<LivingInventoryItemModel>> inventoryByDomain(Ref ref, DomainType domainType) {
  return ref.watch(livingInventoryApiServiceProvider).fetchList(domainType: domainType);
}

@riverpod
Future<LivingInventoryItemModel> inventoryDetail(Ref ref, String id) {
  return ref.watch(livingInventoryApiServiceProvider).fetchDetail(id);
}

@riverpod
Future<List<HealthLogEntryModel>> healthLogs(Ref ref, String itemId) {
  return ref.watch(livingInventoryApiServiceProvider).fetchHealthLogs(itemId);
}

@riverpod
Future<List<ProductionLogEntryModel>> productionLogs(Ref ref, String itemId) {
  return ref.watch(livingInventoryApiServiceProvider).fetchProductionLogs(itemId);
}

@riverpod
Future<List<BreedingLogEntryModel>> breedingLogs(Ref ref, String itemId) {
  return ref.watch(livingInventoryApiServiceProvider).fetchBreedingLogs(itemId);
}

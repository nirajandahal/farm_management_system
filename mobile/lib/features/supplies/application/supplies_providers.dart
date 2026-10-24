import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/consumption_log_model.dart';
import '../data/supply_api_service.dart';
import '../data/supply_forecast_model.dart';
import '../data/supply_model.dart';

part 'supplies_providers.g.dart';

@riverpod
Future<List<SupplyModel>> suppliesList(Ref ref) {
  return ref.watch(supplyApiServiceProvider).fetchList();
}

@riverpod
Future<SupplyModel> supplyDetail(Ref ref, String id) {
  return ref.watch(supplyApiServiceProvider).fetchDetail(id);
}

@riverpod
Future<ForecastResult> supplyForecast(Ref ref, String id) {
  return ref.watch(supplyApiServiceProvider).fetchForecast(id);
}

@riverpod
Future<List<ConsumptionLogModel>> supplyConsumptionHistory(Ref ref, String id) {
  return ref.watch(supplyApiServiceProvider).fetchConsumptionHistory(id);
}

/// keepAlive: true -- this is read via `.notifier` (a one-time read, not a
/// watch), so with the default autoDispose behavior nothing keeps it alive
/// and it can be disposed while restock()/correctStock() are still
/// in-flight, silently dropping the invalidate() calls that are supposed
/// to refresh the UI after the mutation completes.
@Riverpod(keepAlive: true)
class SupplyActionsController extends _$SupplyActionsController {
  @override
  void build() {}

  Future<void> restock(String id, String quantity) async {
    await ref.read(supplyApiServiceProvider).restock(id, quantity);
    _refresh(id);
  }

  Future<void> correctStock(String id, String newStock) async {
    await ref.read(supplyApiServiceProvider).correctStock(id, newStock);
    _refresh(id);
  }

  void _refresh(String id) {
    ref.invalidate(supplyDetailProvider(id));
    ref.invalidate(suppliesListProvider);
    ref.invalidate(supplyConsumptionHistoryProvider(id));
  }
}

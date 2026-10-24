import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import 'living_inventory_item_model.dart';
import 'log_entry_models.dart';

part 'living_inventory_api_service.g.dart';

class LivingInventoryApiService {
  LivingInventoryApiService(this._dio);

  final Dio _dio;

  Future<List<LivingInventoryItemModel>> fetchList({DomainType? domainType}) async {
    final response = await _dio.get('/inventory/', queryParameters: {
      if (domainType != null) 'domain_type': _domainTypeParam(domainType),
    });
    final results = (response.data as Map<String, dynamic>)['results'] as List;
    return results
        .map((json) => LivingInventoryItemModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<LivingInventoryItemModel> fetchDetail(String id) async {
    final response = await _dio.get('/inventory/$id/');
    return LivingInventoryItemModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<HealthLogEntryModel>> fetchHealthLogs(String itemId) async {
    final response = await _dio.get('/inventory/$itemId/health-log/');
    final results = (response.data as Map<String, dynamic>)['results'] as List;
    return results
        .map((json) => HealthLogEntryModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<ProductionLogEntryModel>> fetchProductionLogs(String itemId) async {
    final response = await _dio.get('/inventory/$itemId/production-log/');
    final results = (response.data as Map<String, dynamic>)['results'] as List;
    return results
        .map((json) => ProductionLogEntryModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<BreedingLogEntryModel>> fetchBreedingLogs(String itemId) async {
    final response = await _dio.get('/inventory/$itemId/breeding-log/');
    final results = (response.data as Map<String, dynamic>)['results'] as List;
    return results
        .map((json) => BreedingLogEntryModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  static String _domainTypeParam(DomainType type) => switch (type) {
        DomainType.animal => 'ANIMAL',
        DomainType.crop => 'CROP',
        DomainType.fish => 'FISH',
        DomainType.fungi => 'FUNGI',
      };
}

@riverpod
LivingInventoryApiService livingInventoryApiService(Ref ref) =>
    LivingInventoryApiService(ref.watch(dioProvider));

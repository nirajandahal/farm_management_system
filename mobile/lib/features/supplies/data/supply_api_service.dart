import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import 'consumption_log_model.dart';
import 'supply_forecast_model.dart';
import 'supply_model.dart';

part 'supply_api_service.g.dart';

class SupplyApiService {
  SupplyApiService(this._dio);

  final Dio _dio;

  Future<List<SupplyModel>> fetchList({SupplyCategory? category}) async {
    final response = await _dio.get('/supplies/', queryParameters: {
      if (category != null) 'category': _categoryParam(category),
    });
    final results = (response.data as Map<String, dynamic>)['results'] as List;
    return results.map((json) => SupplyModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  Future<SupplyModel> fetchDetail(String id) async {
    final response = await _dio.get('/supplies/$id/');
    return SupplyModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<ForecastResult> fetchForecast(String id) async {
    try {
      final response = await _dio.get('/supplies/$id/forecast/');
      return ForecastAvailable(SupplyForecastModel.fromJson(response.data as Map<String, dynamic>));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return const ForecastNotComputed();
      if (e.response?.statusCode == 403) return const ForecastNotAllowed();
      rethrow;
    }
  }

  Future<List<ConsumptionLogModel>> fetchConsumptionHistory(String id) async {
    final response = await _dio.get('/supplies/$id/consumption-history/');
    final results = (response.data as Map<String, dynamic>)['results'] as List;
    return results.map((json) => ConsumptionLogModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  Future<SupplyModel> restock(String id, String quantity) async {
    final response = await _dio.post('/supplies/$id/stock-adjustment/', data: {
      'adjustment_type': 'RESTOCK',
      'quantity': quantity,
    });
    return SupplyModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<SupplyModel> correctStock(String id, String newStock) async {
    final response = await _dio.post('/supplies/$id/stock-adjustment/', data: {
      'adjustment_type': 'MANUAL_UPDATE',
      'new_stock': newStock,
    });
    return SupplyModel.fromJson(response.data as Map<String, dynamic>);
  }

  static String _categoryParam(SupplyCategory category) => switch (category) {
        SupplyCategory.animalFeed => 'ANIMAL_FEED',
        SupplyCategory.fertilizer => 'FERTILIZER',
        SupplyCategory.medicine => 'MEDICINE',
        SupplyCategory.seed => 'SEED',
        SupplyCategory.other => 'OTHER',
      };
}

@riverpod
SupplyApiService supplyApiService(Ref ref) => SupplyApiService(ref.watch(dioProvider));

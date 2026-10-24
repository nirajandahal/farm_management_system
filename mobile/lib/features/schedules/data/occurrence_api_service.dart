import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import 'occurrence_model.dart';

part 'occurrence_api_service.g.dart';

class OccurrenceApiService {
  OccurrenceApiService(this._dio);

  final Dio _dio;

  Future<List<OccurrenceModel>> fetchByDate(String isoDate) async {
    final response = await _dio.get('/occurrences/', queryParameters: {'due_date': isoDate});
    final results = (response.data as Map<String, dynamic>)['results'] as List;
    return results
        .map((json) => OccurrenceModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<OccurrenceModel> complete(String id, {String? actualQuantity}) async {
    final response = await _dio.patch(
      '/occurrences/$id/complete/',
      data: {'actual_quantity': ?actualQuantity},
    );
    return OccurrenceModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<OccurrenceModel> skip(String id, {String reason = ''}) async {
    final response = await _dio.patch('/occurrences/$id/skip/', data: {'reason': reason});
    return OccurrenceModel.fromJson(response.data as Map<String, dynamic>);
  }
}

@riverpod
OccurrenceApiService occurrenceApiService(Ref ref) =>
    OccurrenceApiService(ref.watch(dioProvider));

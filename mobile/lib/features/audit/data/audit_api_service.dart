import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import 'audit_log_model.dart';

part 'audit_api_service.g.dart';

class AuditApiService {
  AuditApiService(this._dio);

  final Dio _dio;

  Future<List<AuditLogModel>> fetchLog() async {
    final response = await _dio.get('/audit/');
    final results = (response.data as Map<String, dynamic>)['results'] as List;
    return results.map((json) => AuditLogModel.fromJson(json as Map<String, dynamic>)).toList();
  }
}

@riverpod
AuditApiService auditApiService(Ref ref) => AuditApiService(ref.watch(dioProvider));

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../auth/data/user_model.dart';

part 'team_api_service.g.dart';

class TeamApiService {
  TeamApiService(this._dio);

  final Dio _dio;

  Future<List<UserModel>> fetchTeam() async {
    final response = await _dio.get('/team/');
    final results = (response.data as Map<String, dynamic>)['results'] as List;
    return results.map((json) => UserModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  Future<UserModel> invite(String email) async {
    final response = await _dio.post('/team/invite/', data: {'email': email});
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<UserModel> changeRole(String userId, String role) async {
    final response = await _dio.patch('/team/$userId/', data: {'role': role});
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> remove(String userId) async {
    await _dio.delete('/team/$userId/');
  }
}

@riverpod
TeamApiService teamApiService(Ref ref) => TeamApiService(ref.watch(dioProvider));

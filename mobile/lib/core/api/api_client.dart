import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../storage/secure_token_storage.dart';
import 'auth_interceptor.dart';

part 'api_client.g.dart';

@riverpod
SecureTokenStorage secureTokenStorage(Ref ref) => SecureTokenStorage();

@riverpod
Dio dio(Ref ref) => buildDio(ref.watch(secureTokenStorageProvider));

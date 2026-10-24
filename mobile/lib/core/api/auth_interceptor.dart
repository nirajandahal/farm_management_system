import 'package:dio/dio.dart';

import '../storage/secure_token_storage.dart';
import 'api_config.dart';

/// Attaches the stored access token to every request, and on a 401,
/// attempts one token refresh + retry before giving up. If refresh also
/// fails, tokens are cleared -- the app's auth state provider (built when
/// we implement the auth feature) is responsible for noticing that and
/// routing back to login.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._tokenStorage, this._dio);

  final SecureTokenStorage _tokenStorage;
  final Dio _dio;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _tokenStorage.readAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }

    final refreshToken = await _tokenStorage.readRefreshToken();
    if (refreshToken == null) {
      handler.next(err);
      return;
    }

    try {
      final response = await _dio.post(
        '/auth/token/refresh/',
        data: {'refresh': refreshToken},
        options: Options(headers: {'Authorization': null}),
      );
      final newAccess = response.data['access'] as String;
      await _tokenStorage.saveTokens(access: newAccess, refresh: refreshToken);

      final retryRequest = err.requestOptions;
      retryRequest.headers['Authorization'] = 'Bearer $newAccess';
      final retryResponse = await _dio.fetch(retryRequest);
      handler.resolve(retryResponse);
    } catch (_) {
      await _tokenStorage.clear();
      handler.next(err);
    }
  }
}

Dio buildDio(SecureTokenStorage tokenStorage) {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));
  dio.interceptors.add(AuthInterceptor(tokenStorage, dio));
  return dio;
}

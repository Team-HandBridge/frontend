import 'package:dio/dio.dart';

import '../../storage/token_storage.dart';
import '../auth/token_refresher.dart';

final class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required Dio dio,
    required TokenStorage tokenStorage,
    required TokenRefresher tokenRefresher,
  }) : _dio = dio,
       _tokenStorage = tokenStorage,
       _tokenRefresher = tokenRefresher;

  final Dio _dio;
  final TokenStorage _tokenStorage;
  final TokenRefresher _tokenRefresher;

  static const requiresAuthKey = 'requiresAuth';
  static const retryAttemptedKey = 'authRetryAttempted';

  static const _accessTokenExpiredCode = 'ACCESS_TOKEN_EXPIRED';

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final requiresAuth = options.extra[requiresAuthKey] as bool? ?? true;

    if (!requiresAuth) {
      handler.next(options);
      return;
    }

    try {
      final accessToken = await _tokenStorage.readAccessToken();

      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }

      handler.next(options);
    } catch (error, stackTrace) {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.unknown,
          error: error,
          stackTrace: stackTrace,
          message: 'Access Token을 읽지 못했습니다.',
        ),
      );
    }
  }
}

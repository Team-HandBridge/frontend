import 'package:dio/dio.dart';

import '../../storage/token_storage.dart';

final class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._tokenStorage);

  final TokenStorage _tokenStorage;

  static const requiresAuthKey = 'requiresAuth';

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

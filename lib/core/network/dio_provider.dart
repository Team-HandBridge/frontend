import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/app_config.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: Duration(seconds: 30),
      headers: const {
        Headers.acceptHeader: Headers.jsonContentType,
        Headers.contentTypeHeader: Headers.jsonContentType,
      },
    ),
  );

  ref.onDispose(dio.close);

  return dio;
});

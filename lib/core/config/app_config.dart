import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class AppConfig {
  static String get apiBaseUrl {
    final value = dotenv.env['API_BASE_URL']?.trim();

    if (value == null || value.isEmpty) {
      throw StateError('API_BASE_URL이 설정되지 않았습니다.');
    }

    final uri = Uri.tryParse(value);

    if (uri == null || !uri.hasScheme || uri.host.isEmpty) {
      throw StateError('API_BASE_URL 형식이 올바르지 않습니다: $value');
    }

    return value;
  }
}

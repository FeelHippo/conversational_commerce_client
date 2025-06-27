import 'package:apiClient/src/dio/response_transformer.dart';
import 'package:dio/dio.dart';

class DioFactory {
  static const Duration _defaultMaxAge = Duration(hours: 1);
  static const Duration _defaultMaxStale = Duration(days: 1);

  static const Map<String, Object> defaultCacheOptions = <String, Object>{
    // If getting data from network fails or no network available, try get data from cache instead of an error.
    'DIO_CACHE_KEY_FORCE_REFRESH': true,
    'DIO_CACHE_KEY_TRY_CACHE': true,
    'DIO_CACHE_KEY_MAX_AGE': _defaultMaxAge,
    'DIO_CACHE_KEY_MAX_STALE': _defaultMaxStale,
  };

  static Dio create() {
    final BaseOptions options = BaseOptions(
      baseUrl:
          'https://conversational-commerce-152603240289.europe-west1.run.app',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    final Dio dio = Dio()..options = options;

    dio.transformer = ResponseTransformer();

    return dio;
  }
}

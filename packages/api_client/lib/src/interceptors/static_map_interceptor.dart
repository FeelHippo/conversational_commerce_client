import 'package:dio/dio.dart';

import '../common/static_map_options_provider.dart';

class StaticMapInterceptor extends Interceptor {
  StaticMapInterceptor(this._staticMapOptionsProvider);

  final StaticMapOptionsProvider _staticMapOptionsProvider;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final Map<String, dynamic> headers =
        Map<String, dynamic>.from(options.headers);
    final StaticMapOptions staticMapOptions = _staticMapOptionsProvider.get();
    headers['x-static-map-width'] = staticMapOptions.width;
    headers['x-static-map-height'] = staticMapOptions.height;
    headers['x-static-map-scale'] = staticMapOptions.scale;
    options.headers = headers;
    handler.next(options);
  }
}

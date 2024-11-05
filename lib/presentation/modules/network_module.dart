import 'package:dio/dio.dart';
import 'package:injector/injector.dart';
import 'package:apiClient/main.dart';

class NetworkModule {
  static Dio createDio(Injector injector) {
    return DioFactory.create(
      injector.get<LocaleProvider>(),
      injector.get<StaticMapOptionsProvider>(),
    );
  }

  static ApiClient createApiClient(Injector injector) =>
      ApiClient(injector.get<Dio>());
}

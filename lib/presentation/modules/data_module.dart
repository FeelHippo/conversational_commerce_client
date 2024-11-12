import 'package:apiClient/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injector/injector.dart';
import 'package:storage/main.dart';

class DataModule {
  static FlutterSecureStorage createFlutterSecureStorage(Injector injector) =>
      const FlutterSecureStorage();

  static DateMapper createDateMapper(Injector injector) => const DateMapper();

  static StaticMapOptionsProvider createStaticMapOptionsProvider(
    Injector injector,
  ) =>
      StaticMapOptionsProvider(injector.get<DisplayMetricsProvider>());

  static LocaleProvider createLocaleProvider(Injector injector) =>
      LocaleProvider();

  static UserPreferences createUserPreferences(Injector injector) =>
      StoreUserPreferences();

  static DisplayMetricsProvider createDisplayMetricsProvider(
    Injector injector,
  ) =>
      DisplayMetricsProvider();

  static POIMapper createPOIMapper(Injector injector) => POIMapper();

  static POIsProvider createPOIsProvider(Injector injector) =>
      NetworkPOIsProvider(
        injector.get<ApiClient>(),
        injector.get<POIMapper>(),
      );

  static GoogleSearchMapper createGooglePlaceMapper(Injector injector) =>
      const GoogleSearchMapper();

  static PlaceDetailsMapper createPlaceDetailsMapper(Injector injector) =>
      const PlaceDetailsMapper();
}

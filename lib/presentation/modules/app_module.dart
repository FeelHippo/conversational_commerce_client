import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:injector/injector.dart';
import 'package:stadtplan/presentation/dashboard_screen/utils/marker_utils.dart';
import 'package:stadtplan/utils/url_opener.dart';

class AppModule {

  static DefaultCacheManager createDefaultCacheManager(Injector injector) =>
      DefaultCacheManager();

  static MarkerUtils createMarkerUtils(Injector injector) => MarkerUtils(
        injector.get<DefaultCacheManager>(),
      );

  static Connectivity createConnectivity(Injector injector) => Connectivity();

  static UrlOpener createUrlOpener(Injector injector) => UrlOpener();
}

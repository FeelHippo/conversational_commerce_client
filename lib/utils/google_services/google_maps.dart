import 'dart:io';

import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

Future<void> initGoogleMaps() async {
  if (Platform.isAndroid) {
    await GoogleMapsFlutterAndroid()
        .initializeWithRenderer(AndroidMapRenderer.latest);
  }

  /// https://pub.dev/packages/google_maps_flutter_android#display-mode
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
  }
}

import 'package:fimber/fimber.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PositionInteractor {
  PositionInteractor();

  Future<LatLng> getUserPosition() async {

    // defaults to Zurich city center
    // TODO(Filippo): move this to dotenv
    final LatLng initialCameraPosition = LatLng(
      47.3729434,
      8.5326103,
    );

    try {
      final bool isGpsEnabled = await Geolocator.isLocationServiceEnabled();
      if (isGpsEnabled) {
        final LocationPermission locationPermission =
          await Geolocator.checkPermission();
        if (locationPermission != LocationPermission.deniedForever &&
            locationPermission != LocationPermission.denied) {
          final Position position = await Geolocator.getCurrentPosition(
            forceAndroidLocationManager: true,
            desiredAccuracy: LocationAccuracy.bestForNavigation,
            timeLimit: const Duration(seconds: 5),
          );
          return LatLng(position.latitude, position.longitude);
        }
      }
      return initialCameraPosition;
    } catch (e, stacktrace) {
      Fimber.e("can't fetch geolocation", ex: e, stacktrace: stacktrace);
      return initialCameraPosition;
    }
  }

}
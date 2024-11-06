import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PositionInteractor {
  PositionInteractor();

  StreamController<LatLng>? _positionStreamController;

  Stream<LatLng> trackPosition() {
    Timer? timer;

    _positionStreamController ??= StreamController<LatLng>(
      onCancel: () {
        timer?.cancel();
        _positionStreamController?.close();
      },
      onListen: () async {
        timer = Timer.periodic(
          const Duration(seconds: 5),
          (Timer timer) async {
            final bool isGpsEnabled =
                await Geolocator.isLocationServiceEnabled();
            if (isGpsEnabled) {
              final LocationPermission locationPermission =
                  await Geolocator.checkPermission();
              switch (locationPermission) {
                case LocationPermission.always:
                case LocationPermission.whileInUse:
                  final Position position = await Geolocator.getCurrentPosition(
                    forceAndroidLocationManager: true,
                    desiredAccuracy: LocationAccuracy.bestForNavigation,
                    timeLimit: const Duration(seconds: 5),
                  );
                  _positionStreamController?.add(
                    LatLng(
                      position.latitude,
                      position.longitude,
                    ),
                  );
                  break;
                case LocationPermission.denied:
                  await Geolocator.requestPermission();
                  break;
                case LocationPermission.deniedForever:
                  break;
                default:
                  await Geolocator.requestPermission();
              }
            }
          },
        );
      },
    );

    return _positionStreamController!.stream;
  }
}

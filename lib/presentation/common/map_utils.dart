import 'dart:io';
import 'dart:ui' as ui;

import 'package:fimber/fimber.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class MapUtils {
  static Future<Uint8List> getBytesFromAsset(String path) async {
    final ByteData data = await rootBundle.load(path);
    final ui.Codec codec =
        await ui.instantiateImageCodec(data.buffer.asUint8List());
    final ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static Future<bool> checkLocationService() async {
    bool serviceEnabled = false;
    final Location location = Location();
    try {
      /// Check Location Service Status
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        /// If Location Service is Off Request for Location
        serviceEnabled = await location.requestService();
      }

      if (!serviceEnabled && Platform.isIOS) {
        return serviceEnabled;
      } else if (!serviceEnabled) {
        serviceEnabled = await checkLocationService();
      } else {
        serviceEnabled = true;
      }
    } catch (e) {
      Fimber.d(e.toString());
    }

    Fimber.d('_serviceEnabled$serviceEnabled');
    return serviceEnabled;
  }
}

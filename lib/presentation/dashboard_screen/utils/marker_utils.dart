import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Class MarkerUtils
///
/// USed to get all marker related things
class MarkerUtils {
  MarkerUtils(this.cacheManager);

  final DefaultCacheManager cacheManager;

  static const double dashBoardIconSize = 70;

  ///userMarkerId
  static String userMarkerId = '@authSense@2020';

  static String searchMarkerId = '@authSense@2023';

  Future<BitmapDescriptor?> getMarkerImageFromUrl(
      String url, BuildContext context) async {
    final File markerImageFile = await cacheManager.getSingleFile(url);
    Uint8List? markerImageBytes = await markerImageFile.readAsBytes();
    double scale = MediaQuery.of(context).devicePixelRatio;
    if (scale > 3) {
      scale = 3;
    }
    markerImageBytes =
        await _resizeImageBytes(markerImageBytes, (40 * scale).toInt());
    if (markerImageBytes != null) {
      return BitmapDescriptor.fromBytes(markerImageBytes);
    }
    return null;
  }

  Future<ui.Image?> getImageFromUrl(String url, BuildContext context) async {
    final File markerImageFile = await cacheManager.getSingleFile(url);
    Uint8List? markerImageBytes = await markerImageFile.readAsBytes();
    double scale = MediaQuery.of(context).devicePixelRatio;
    if (scale > 3) {
      scale = 3;
    }
    markerImageBytes =
        await _resizeImageBytes(markerImageBytes, (100 * scale).toInt());

    if (markerImageBytes != null) {
      return decodeImageFromList(
        markerImageBytes.buffer.asUint8List(
            markerImageBytes.offsetInBytes, markerImageBytes.lengthInBytes),
      );
    }
    return null;
  }

  Future<Uint8List?> _resizeImageBytes(
      Uint8List imageBytes, int targetWidth) async {
    final Codec imageCodec =
        await instantiateImageCodec(imageBytes, targetWidth: targetWidth);
    final FrameInfo frameInfo = await imageCodec.getNextFrame();
    final ByteData? byteData =
        await frameInfo.image.toByteData(format: ImageByteFormat.png);

    return byteData?.buffer.asUint8List();
  }

  /// Get Distance
  static String distanceBetweenLatLng(
      {required double lat1,
      required double lon1,
      required double lat2,
      required double lon2,
      String unit = 'K'}) {
    final double theta = lon1 - lon2;
    double dist = sin(deg2rad(lat1)) * sin(deg2rad(lat2)) +
        cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * cos(deg2rad(theta));
    dist = acos(dist);
    dist = rad2deg(dist);
    dist = dist * 60 * 1.1515;

    /// It Is is in KM
    dist = dist * 1.609344;
    return dist.toStringAsFixed(2);
  }

  /// Degree to Radius
  static double deg2rad(double deg) {
    return deg * pi / 180.0;
  }

  /// Radius to Degree
  static double rad2deg(double rad) {
    return rad * 180.0 / pi;
  }

  static Future<Uint8List?> getBytesFromAsset(String path) async {
    final ByteData data = await rootBundle.load(path);
    final ui.Codec codec =
        await ui.instantiateImageCodec(data.buffer.asUint8List());
    final ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }
}

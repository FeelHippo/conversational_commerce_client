import 'dart:math';

import 'package:vector_math/vector_math.dart';

class Haversine {
  // return distance in meters
  static const double R = 6372800;

  /// distance in meters between two coordinates
  static double formula(double lat1, double lon1, double lat2, double lon2) {
    final double distanceLatitude = radians(lat2 - lat1);
    final double distanceLongitude = radians(lon2 - lon1);
    final double latitudeOneRadian = radians(lat1);
    final double latitudeTwoRadian = radians(lat2);
    final double a = pow(sin(distanceLatitude / 2), 2) +
        pow(sin(distanceLongitude / 2), 2) *
            cos(latitudeOneRadian) *
            cos(latitudeTwoRadian);
    final double c = 2 * asin(sqrt(a));
    return R * c;
  }
}

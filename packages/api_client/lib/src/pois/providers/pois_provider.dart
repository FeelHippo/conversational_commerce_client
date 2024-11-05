import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/pois_model.dart';

abstract class POIsProvider {
  Future<List<POIModel>> getPOIs({
    required LatLngBounds bounds,
    required String type,
  });
}

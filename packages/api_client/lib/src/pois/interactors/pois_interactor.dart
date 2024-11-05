import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/pois_model.dart';
import '../providers/pois_provider.dart';

class POIsInteractor {
  POIsInteractor(this._poisProvider);

  final POIsProvider _poisProvider;

  Future<List<POIModel>> getPOIs({
    required LatLngBounds bounds,
    required String type,
  }) async {
    return _poisProvider.getPOIs(
      bounds: bounds,
      type: type,
    );
  }
}

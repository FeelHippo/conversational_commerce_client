import '../models/pois_model.dart';

abstract class POIsProvider {
  Future<List<POIModel>> getPOIs();
}

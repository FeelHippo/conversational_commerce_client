import 'package:apiClient/src/pois/models/pois_model.dart';
import 'package:apiClient/src/pois/providers/pois_provider.dart';

class POIsInteractor {
  POIsInteractor(this._poisProvider);

  final POIsProvider _poisProvider;

  Future<List<POIModel>> getPOIs() async {
    return _poisProvider.getPOIs();
  }
}

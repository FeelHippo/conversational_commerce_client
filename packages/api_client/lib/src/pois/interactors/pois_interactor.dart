import '../models/pois_model.dart';
import '../providers/pois_provider.dart';

class POIsInteractor {
  POIsInteractor(this._poisProvider);

  final POIsProvider _poisProvider;

  Future<List<POIModel>> getPOIs() async {
    return _poisProvider.getPOIs();
  }
}

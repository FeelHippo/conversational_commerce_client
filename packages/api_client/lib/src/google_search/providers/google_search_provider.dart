import '../models/place_details_model.dart';
import '../models/predictions_model.dart';

abstract class GoogleSearchProvider {
  Future<PredictionsModel> fetchGooglePlaceAddress({
    required String url,
  });

  Future<PlaceDetailsModel> fetchGooglePlaceDetails({
    required String url,
  });
}

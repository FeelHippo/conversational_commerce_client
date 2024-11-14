import 'package:apiClient/src/google_search/models/place_details_model.dart';
import 'package:apiClient/src/google_search/models/predictions_model.dart';

abstract class GoogleSearchProvider {
  Future<PredictionsModel> fetchGooglePlaceAddress({
    required String url,
  });

  Future<PlaceDetailsModel> fetchGooglePlaceDetails({
    required String url,
  });
}

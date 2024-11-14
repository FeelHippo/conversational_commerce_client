import 'package:apiClient/src/google_search/models/place_details_model.dart';
import 'package:apiClient/src/google_search/models/predictions_model.dart';
import 'package:apiClient/src/google_search/providers/google_search_provider.dart';

class GoogleSearchInteractor {
  GoogleSearchInteractor({
    required this.googleSearchProvider,
  });

  final GoogleSearchProvider googleSearchProvider;

  Future<PredictionsModel> fetchGooglePlaceAddress({
    required String input,
    required String sessionToken,
  }) async {
    final Map<String, String> queryParameters = <String, String>{
      'input': input,
      'components': 'country:ch|country:fr|country:de||country:it',
      'sessiontoken': sessionToken,
      'key':
          'AIzaSyAWhjEQx7GXREyhhMV9OC1iGJpWXuktAmg', // TODO(Filippo): replace with dotenv
    };
    final Uri uri = Uri.https(
      'maps.googleapis.com',
      '/maps/api/place/autocomplete/json',
      queryParameters,
    );

    return googleSearchProvider.fetchGooglePlaceAddress(url: uri.toString());
  }

  Future<PlaceDetailsModel> fetchGooglePlaceDetails({
    required String placeId,
    required String sessionToken,
  }) async {
    final Map<String, String> queryParameters = <String, String>{
      'place_id': placeId,
      'sessiontoken': sessionToken,
      'key':
          'AIzaSyAWhjEQx7GXREyhhMV9OC1iGJpWXuktAmg', // TODO(Filippo): replace with dotenv
    };
    final Uri uri = Uri.https(
      'maps.googleapis.com',
      '/maps/api/place/details/json',
      queryParameters,
    );

    return googleSearchProvider.fetchGooglePlaceDetails(url: uri.toString());
  }
}

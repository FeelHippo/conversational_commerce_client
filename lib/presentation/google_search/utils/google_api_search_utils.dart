import 'package:apiClient/main.dart';

class GoogleApiSearchUtils {
  static String political = 'political';
  static String locality = 'locality';
  static String route = 'route';
  static String countryCode = 'country';
  static String streetNumber = 'street_number';
  static String postalCode = 'postal_code';

  static Future<AddressModel> parsePlace({
    required PlaceDetailsModel prediction,
  }) async {
    final double latitude = prediction.result.geometryModel.location.lat;
    final double longitude = prediction.result.geometryModel.location.lng;
    final String address = prediction.result.formattedAddress;
    String zip = '';
    String city = '';
    String streetNm = '';
    String streetNr = '';
    String country = '';

    final List<AddressComponentsModel> components =
        prediction.result.addressComponents;
    for (final AddressComponentsModel element in components) {
      final List<String> type = element.types;
      if (type.contains(postalCode)) {
        zip = element.longName;
      }
      if (type.contains(locality) && type.contains(political)) {
        city = element.longName;
      }
      if (type.contains(route)) {
        streetNm = element.longName;
      }
      if (type.contains(streetNumber)) {
        streetNr = element.longName;
      }
      if (type.contains(countryCode)) {
        country = element.shortName;
      }
    }
    return AddressModel(
      latitude,
      longitude,
      address,
      zip,
      city,
      streetNm,
      streetNr,
      country,
    );
  }
}

import '../dto/pois_dto.dart';
import '../google_search/models/location_model.dart';

class LocationMapper {
  const LocationMapper();

  GoogleLocationModel map(Coordinates dto) {
    return GoogleLocationModel(
      latitude: dto.latitude,
      longitude: dto.longitude,
    );
  }
}

import 'package:apiClient/src/dto/pois_dto.dart';
import 'package:apiClient/src/pois/models/pois_model.dart';

class POIMapper {
  POIMapper();

  POIModel map(POIDto dto) {
    return POIModel(
      address: dto.address,
      city: dto.city,
      id: dto.id,
      isActive: dto.isActive,
      lat: dto.lat,
      lng: dto.lng,
      name: dto.name,
      zip: dto.zip,
      iconUrl: dto.iconUrl,
    );
  }
}

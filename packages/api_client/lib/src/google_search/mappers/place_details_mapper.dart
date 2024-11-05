import '../../dto/place_details_dto.dart';
import '../models/place_details_model.dart';

class PlaceDetailsMapper {
  const PlaceDetailsMapper();

  PlaceDetailsModel map(PlaceDetailsDto dto) {
    return PlaceDetailsModel(mapResultDtoToModel(dto.result), dto.status);
  }

  ResultModel mapResultDtoToModel(ResultDto result) {
    return ResultModel(
      mapAddressComponentsDtoToModel(result.addressComponents),
      mapGeometryDtoToModel(result.geometry),
      result.formattedAddress,
    );
  }

  GeometryModel mapGeometryDtoToModel(GeometryDto result) {
    return GeometryModel(mapLocationDtoToModel(result.location));
  }

  LocationModel mapLocationDtoToModel(LocationDto dto) {
    return LocationModel(dto.lat, dto.lng);
  }

  List<AddressComponentsModel> mapAddressComponentsDtoToModel(
    List<AddressComponentsDto> addressComponentsDto,
  ) {
    final List<AddressComponentsModel> listAddressComponentsModel =
        <AddressComponentsModel>[];

    for (final AddressComponentsDto dtoModel in addressComponentsDto) {
      listAddressComponentsModel.add(
        AddressComponentsModel(
          dtoModel.longName,
          dtoModel.shortName,
          dtoModel.types,
        ),
      );
    }

    return listAddressComponentsModel;
  }
}

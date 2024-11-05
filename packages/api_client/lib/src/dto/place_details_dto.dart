import 'package:json_annotation/json_annotation.dart';

part 'place_details_dto.g.dart';

@JsonSerializable()
class PlaceDetailsDto {
  PlaceDetailsDto({
    required this.result,
    required this.status,
  });

  factory PlaceDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsDtoFromJson(json);

  final ResultDto result;
  final String status;

  Map<String, dynamic> toJson() => _$PlaceDetailsDtoToJson(this);
}

@JsonSerializable()
class ResultDto {
  ResultDto({
    required this.addressComponents,
    required this.geometry,
    required this.formattedAddress,
  });

  factory ResultDto.fromJson(Map<String, dynamic> json) =>
      _$ResultDtoFromJson(json);

  final List<AddressComponentsDto> addressComponents;
  final GeometryDto geometry;
  final String formattedAddress;

  Map<String, dynamic> toJson() => _$ResultDtoToJson(this);
}

@JsonSerializable()
class GeometryDto {
  GeometryDto({required this.location});

  factory GeometryDto.fromJson(Map<String, dynamic> json) =>
      _$GeometryDtoFromJson(json);

  final LocationDto location;

  Map<String, dynamic> toJson() => _$GeometryDtoToJson(this);
}

@JsonSerializable()
class LocationDto {
  LocationDto({required this.lat, required this.lng});

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  final double lat;
  final double lng;

  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);
}

@JsonSerializable()
class AddressComponentsDto {
  AddressComponentsDto({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  factory AddressComponentsDto.fromJson(Map<String, dynamic> json) =>
      _$AddressComponentsDtoFromJson(json);

  final String longName;
  final String shortName;
  final List<String> types;

  Map<String, dynamic> toJson() => _$AddressComponentsDtoToJson(this);
}

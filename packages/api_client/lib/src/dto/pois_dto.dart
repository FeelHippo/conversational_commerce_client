import 'package:json_annotation/json_annotation.dart';

part 'pois_dto.g.dart';

@JsonSerializable()
class POIDto {
  POIDto({
    required this.address,
    required this.city,
    required this.id,
    required this.isActive,
    required this.lat,
    required this.lng,
    required this.name,
    required this.zip,
    required this.iconUrl,
  });

  final String address;
  final String city;
  final int id;
  final bool isActive;
  final double lat;
  final double lng;
  final String name;
  final String zip;
  final String iconUrl;

  factory POIDto.fromJson(Map<String, dynamic> json) => _$POIDtoFromJson(json);
  Map<String, dynamic> toJson() => _$POIDtoToJson(this);
}

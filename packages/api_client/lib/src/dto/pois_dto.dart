import 'package:json_annotation/json_annotation.dart';

part 'pois_dto.g.dart';

@JsonSerializable()
class POIDto {
  POIDto({
    required this.geometry,
    this.poiId,
    this.symbol,
    this.symbolId,
  });

  factory POIDto.fromJson(Map<String, dynamic> json) => _$POIDtoFromJson(json);
  Map<String, dynamic> toJson() => _$POIDtoToJson(this);

  @JsonKey(name:'Geometry')
  final GeometryDto geometry;
  @JsonKey(name:'PoiId')
  String? poiId;
  @JsonKey(name:'Symbol')
  String? symbol;
  @JsonKey(name:'SymbolId')
  String? symbolId;
}

@JsonSerializable()
class GeometryDto {
  GeometryDto({
    required this.type,
    this.longitude,
    this.latitude,
    this.points,
  });

  factory GeometryDto.fromJson(Map<String, dynamic> json) =>
      _$GeometryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryDtoToJson(this);

  @JsonKey(name:'__type')
  final String type;
  @JsonKey(name:'X')
  double? longitude;
  @JsonKey(name:'Y')
  double? latitude;
  @JsonKey(name:'Points')
  List<Point>? points;

}

@JsonSerializable()
class Point {
  Point({
    required this.pointsList,
  });

  @JsonKey(name:'Points')
  List<Coordinates> pointsList;

  factory Point.fromJson(Map<String, dynamic> json) =>
      _$PointFromJson(json);
  Map<String, dynamic> toJson() => _$PointToJson(this);
}

@JsonSerializable()
class Coordinates {
  Coordinates({
    required this.longitude,
    required this.latitude,
  });

  @JsonKey(name:'X')
  final double longitude;
  @JsonKey(name:'Y')
  final double latitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
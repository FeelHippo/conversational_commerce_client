import 'package:json_annotation/json_annotation.dart';

part 'dynamic_service_request.g.dart';

@JsonSerializable()
class DynamicServiceRequest {
  DynamicServiceRequest({
    required this.appId,
    required this.bbox,
    required this.dynamicServiceId,
    required this.layernames,
    required this.wkid,
  });

  factory DynamicServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$DynamicServiceRequestFromJson(json);

  @JsonKey(name:'appId')
  final int appId;
  final BboxRequest bbox;
  @JsonKey(name:'dynamicServiceId')
  final int dynamicServiceId;
  final List<String> layernames;
  final int wkid;

  Map<String, dynamic> toJson() => _$DynamicServiceRequestToJson(this);
}

@JsonSerializable()
class BboxRequest {
  BboxRequest({
    required this.XMax,
    required this.XMin,
    required this.YMax,
    required this.YMin,
    required this.type,
  });

  factory BboxRequest.fromJson(Map<String, dynamic> json) =>
      _$BboxRequestFromJson(json);

  @JsonKey(name:'XMax')
  final double XMax;
  @JsonKey(name:'XMin')
  final double XMin;
  @JsonKey(name:'YMax')
  final double YMax;
  @JsonKey(name:'YMin')
  final double YMin;
  @JsonKey(name:'__type')
  final String type;

  Map<String, dynamic> toJson() => _$BboxRequestToJson(this);
}
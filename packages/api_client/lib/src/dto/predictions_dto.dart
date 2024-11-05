import 'package:json_annotation/json_annotation.dart';

part 'predictions_dto.g.dart';

@JsonSerializable()
class PredictionsDto {
  PredictionsDto({
    required this.predictions,
    required this.status,
  });

  factory PredictionsDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionsDtoFromJson(json);

  List<PredictionsDataDto> predictions;
  final String status;

  Map<String, dynamic> toJson() => _$PredictionsDtoToJson(this);
}

@JsonSerializable()
class PredictionsDataDto {
  PredictionsDataDto({required this.description, required this.placeId});

  factory PredictionsDataDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionsDataDtoFromJson(json);

  String description;
  String placeId;

  Map<String, dynamic> toJson() => _$PredictionsDataDtoToJson(this);
}

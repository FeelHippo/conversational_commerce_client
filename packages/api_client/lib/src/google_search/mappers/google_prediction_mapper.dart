import 'package:apiClient/src/dto/predictions_dto.dart';
import 'package:apiClient/src/google_search/models/predictions_model.dart';

class GoogleSearchMapper {
  const GoogleSearchMapper();

  PredictionsModel map(PredictionsDto dto) {
    return PredictionsModel(
      mapPredictionDtoToModel(predictionsDto: dto.predictions),
      dto.status,
    );
  }

  List<PredictionsDataModel> mapPredictionDtoToModel({
    List<PredictionsDataDto>? predictionsDto,
  }) {
    final List<PredictionsDataModel> listPredictionsMode =
        <PredictionsDataModel>[];

    if (predictionsDto != null) {
      for (final PredictionsDataDto dtoModel in predictionsDto) {
        listPredictionsMode.add(
          PredictionsDataModel(dtoModel.description, dtoModel.placeId),
        );
      }
    }

    return listPredictionsMode;
  }
}

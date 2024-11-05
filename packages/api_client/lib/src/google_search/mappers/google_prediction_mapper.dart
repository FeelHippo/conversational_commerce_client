import '../../dto/predictions_dto.dart';
import '../models/predictions_model.dart';

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

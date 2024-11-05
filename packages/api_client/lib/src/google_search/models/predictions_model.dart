import 'package:equatable/equatable.dart';

class PredictionsModel extends Equatable {
  const PredictionsModel(this.predictions, this.status);

  final List<PredictionsDataModel> predictions;
  final String status;

  @override
  List<Object> get props => <Object>[predictions, status];
}

class PredictionsDataModel extends Equatable {
  const PredictionsDataModel(
    this.description,
    this.placeId,
  );

  final String description;
  final String placeId;

  @override
  List<Object> get props => <Object>[
        description,
        placeId,
      ];
}

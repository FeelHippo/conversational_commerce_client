import 'package:equatable/equatable.dart';
import '../../google_search/models/location_model.dart';

class POIModel extends Equatable {
  const POIModel(
      this.position,
      this.iconUrl,
  );
  final GoogleLocationModel position;
  final String iconUrl;

  @override
  List<Object?> get props => <Object?>[
        position,
        iconUrl,
      ];
}

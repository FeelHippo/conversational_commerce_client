import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:apiClient/main.dart';

class POIViewModel extends Equatable {
  const POIViewModel(this._model);
  final POIModel _model;

  LatLng get position =>
      LatLng(_model.position.latitude, _model.position.longitude);

  String get markerIconUrl => _model.iconUrl;

  @override
  List<Object> get props => <Object>[_model];
}

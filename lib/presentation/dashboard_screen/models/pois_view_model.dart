import 'package:apiClient/main.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class POIViewModel extends Equatable {
  const POIViewModel(this._model);
  final POIModel _model;

  LatLng get position => LatLng(_model.lat, _model.lng);

  String get iconUrl => _model.iconUrl;

  @override
  List<Object> get props => <Object>[_model];
}

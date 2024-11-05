import 'package:equatable/equatable.dart';
import 'package:apiClient/main.dart';

abstract class GoogleSearchState extends Equatable {
  const GoogleSearchState();
}

class InitialGoogleSearchState extends GoogleSearchState {
  @override
  List<Object> get props => <Object>[];
}

class LoadingGoogleSearchState extends GoogleSearchState {
  const LoadingGoogleSearchState();

  @override
  List<Object> get props => <Object>[];
}

class SuccessGooglePlacesState extends GoogleSearchState {
  const SuccessGooglePlacesState({required this.predictions});

  final List<PredictionsDataModel> predictions;

  @override
  List<Object> get props => <Object>[predictions];
}

class ErrorGooglePlacesState extends GoogleSearchState {
  const ErrorGooglePlacesState({this.error});

  final dynamic error;

  @override
  List<Object?> get props => <Object?>[error];
}

class EmptyResultState extends GoogleSearchState {
  const EmptyResultState();

  @override
  List<Object> get props => <Object>[];
}

class SuccessGooglePlacesDetailsState extends GoogleSearchState {
  const SuccessGooglePlacesDetailsState({required this.placeDetailsModel});

  final PlaceDetailsModel placeDetailsModel;

  @override
  List<Object> get props => <Object>[placeDetailsModel];
}

class ErrorGooglePlacesDetailsState extends GoogleSearchState {
  const ErrorGooglePlacesDetailsState({
    this.error,
    this.isPlaceDetailsNotFound = false,
  });

  final dynamic error;
  final bool isPlaceDetailsNotFound;

  @override
  List<Object?> get props => <Object?>[error, isPlaceDetailsNotFound];
}

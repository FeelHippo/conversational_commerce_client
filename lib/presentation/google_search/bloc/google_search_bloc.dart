import 'package:bloc/bloc.dart';
import 'package:apiClient/main.dart';
import 'package:stadtplan/presentation/google_search/bloc/bloc.dart';

class GoogleSearchBloc extends Bloc<GoogleSearchEvent, GoogleSearchState> {
  GoogleSearchBloc({required this.googlePlaceInteractor})
      : super(InitialGoogleSearchState()) {
    on<FetchGooglePlaceAddressEvent>(handleFetchGooglePlaceAddress);
    on<FetchGooglePlaceDetailsEvent>(handleFetchGooglePlaceDetails);
    on<EmptyStateEvent>(handleEmptyState);
  }

  final GoogleSearchInteractor googlePlaceInteractor;

  Future<void> handleFetchGooglePlaceAddress(
    FetchGooglePlaceAddressEvent event,
    Emitter<GoogleSearchState> emit,
  ) async {
    try {
      emit(const LoadingGoogleSearchState());

      final PredictionsModel predictionsModel =
          await googlePlaceInteractor.fetchGooglePlaceAddress(
        input: event.input,
        sessionToken: event.sessionToken,
      );

      if (predictionsModel.status == 'OK') {
        emit(
          SuccessGooglePlacesState(
            predictions: predictionsModel.predictions,
          ),
        );
      } else {
        emit(const EmptyResultState());
      }
    } catch (e) {
      emit(ErrorGooglePlacesState(error: e));
    }
  }

  Future<void> handleFetchGooglePlaceDetails(
    FetchGooglePlaceDetailsEvent event,
    Emitter<GoogleSearchState> emit,
  ) async {
    try {
      emit(const LoadingGoogleSearchState());

      final PlaceDetailsModel placeDetailsModel =
          await googlePlaceInteractor.fetchGooglePlaceDetails(
        placeId: event.placeId,
        sessionToken: event.sessionToken,
      );

      if (placeDetailsModel.status == 'OK') {
        emit(
          SuccessGooglePlacesDetailsState(
            placeDetailsModel: placeDetailsModel,
          ),
        );
      } else {
        emit(const ErrorGooglePlacesDetailsState(isPlaceDetailsNotFound: true));
      }
    } catch (e) {
      emit(ErrorGooglePlacesDetailsState(error: e));
    }
  }

  Future<void> handleEmptyState(
    EmptyStateEvent event,
    Emitter<GoogleSearchState> emit,
  ) async {
    emit(const EmptyResultState());
  }
}

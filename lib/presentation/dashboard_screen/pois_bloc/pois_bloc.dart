import 'dart:async';

import 'package:apiClient/main.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stadtplan/constants/list_constants.dart';
import 'package:stadtplan/presentation/dashboard_screen/models/pois_view_model.dart';

part 'pois_event.dart';
part 'pois_state.dart';

class POIsBloc extends Bloc<POIsEvent, POIsState> {
  POIsBloc(this._poisInteractor)
      : super(POIsState(loading: LoadingPois.initializing)) {
    on<FetchPOIsEvent>(handleFetchPOIs);
    on<MoveMapToLocationEvent>(handleMoveMapToLocation);
    on<FilterPOIsEvent>(handleFilterPOIs);
  }

  final POIsInteractor _poisInteractor;

  FutureOr<void> handleFetchPOIs(
    FetchPOIsEvent event,
    Emitter<POIsState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          loading: LoadingPois.loading,
          addressModel: null,
          error: null,
        ),
      );

      final List<POIModel> poisModel = await _poisInteractor.getPOIs();
      emit(
        state.copyWith(
          pois: poisModel.map(POIViewModel.new).toList(),
          loading: LoadingPois.none,
        ),
      );
    } catch (e, stacktrace) {
      Fimber.e('fetch pois error', ex: e, stacktrace: stacktrace);
    }
  }

  void handleMoveMapToLocation(
    MoveMapToLocationEvent event,
    Emitter<POIsState> emit,
  ) {
    try {
      emit(
        state.copyWith(
          loading: LoadingPois.loading,
          addressModel: null,
          error: null,
        ),
      );
      emit(state.copyWith(
          addressModel: event.addressModel, loading: LoadingPois.none));
    } catch (e, stacktrace) {
      Fimber.e('move map position error', ex: e, stacktrace: stacktrace);
    }
  }

  FutureOr<void> handleFilterPOIs(
    FilterPOIsEvent event,
    Emitter<POIsState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          loading: LoadingPois.loading,
          addressModel: null,
          error: null,
        ),
      );
      final Map<QuickFilters, bool> quickFilterStatusCopy =
          state.quickFilterStatus ?? ListConstants.quickFilterStatus;
      quickFilterStatusCopy[QuickFilters.values.firstWhere(
              (QuickFilters value) => value.name == event.filterSelected)] =
          !quickFilterStatusCopy[event.filterSelected]!;
      emit(
        state.copyWith(
          quickFilterStatus: quickFilterStatusCopy,
          loading: LoadingPois.none,
        ),
      );
    } catch (e, stacktrace) {
      Fimber.e('handle filter POIs error', ex: e, stacktrace: stacktrace);
    }
  }
}

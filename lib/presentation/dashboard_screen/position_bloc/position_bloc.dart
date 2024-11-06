import 'package:apiClient/main.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'position_event.dart';
part 'position_state.dart';

class PositionBloc extends Bloc<PositionEvent, PositionState> {
  PositionBloc(this._positionInteractor) : super(PositionState()) {
    on<StartTrackingPositionEvent>(_handleTrackingPositionEvent);
  }

  final PositionInteractor _positionInteractor;

  Future<void> _handleTrackingPositionEvent(
    StartTrackingPositionEvent event,
    Emitter<PositionState> emit,
  ) async {
    try {
      emit(state.copyWith(loading: true));
      _positionInteractor.trackPosition().listen(
            (LatLng currentPosition) => emit(
              state.copyWith(
                newPosition: currentPosition,
                loading: false,
              ),
            ),
          );
    } catch (e, stacktrace) {
      Fimber.e("can't fetch geolocation", ex: e, stacktrace: stacktrace);
    }
  }
}

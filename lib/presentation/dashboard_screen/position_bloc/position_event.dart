part of 'position_bloc.dart';

abstract class PositionEvent extends Equatable {
  const PositionEvent();
}

class StartTrackingPositionEvent extends PositionEvent {
  const StartTrackingPositionEvent();

  @override
  List<Object?> get props => <Object?>[];
}

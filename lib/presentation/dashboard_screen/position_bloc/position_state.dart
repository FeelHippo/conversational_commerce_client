part of 'position_bloc.dart';

class PositionState extends Equatable {
  const PositionState({
    // defaults to Zurich City Center
    this.currentPosition = const LatLng(
      47.3729434,
      8.5326103,
    ),
    this.loading = false,
  });

  final LatLng currentPosition;
  final bool loading;

  PositionState copyWith({
    LatLng? newPosition,
    bool? loading,
  }) {
    return PositionState(
      currentPosition: newPosition ?? this.currentPosition,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => <Object>[
        currentPosition,
        loading,
      ];
}

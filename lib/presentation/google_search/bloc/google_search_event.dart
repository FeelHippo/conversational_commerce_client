import 'package:equatable/equatable.dart';

abstract class GoogleSearchEvent extends Equatable {
  const GoogleSearchEvent();
}

class FetchGooglePlaceAddressEvent extends GoogleSearchEvent {
  const FetchGooglePlaceAddressEvent({
    required this.input,
    required this.sessionToken,
  });

  final String input;
  final String sessionToken;

  @override
  List<Object> get props => <Object>[input, sessionToken];
}

class EmptyStateEvent extends GoogleSearchEvent {
  const EmptyStateEvent();

  @override
  List<Object> get props => <Object>[];
}

class FetchGooglePlaceDetailsEvent extends GoogleSearchEvent {
  const FetchGooglePlaceDetailsEvent({
    required this.placeId,
    required this.sessionToken,
  });

  final String placeId;
  final String sessionToken;

  @override
  List<Object> get props => <Object>[placeId, sessionToken];
}

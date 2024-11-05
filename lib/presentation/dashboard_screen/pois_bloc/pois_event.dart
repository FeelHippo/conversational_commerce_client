part of 'pois_bloc.dart';

abstract class POIsEvent extends Equatable {
  const POIsEvent();
}

class FetchPOIsEvent extends POIsEvent {
  const FetchPOIsEvent(this.bounds,);

  final LatLngBounds bounds;

  @override
  List<Object> get props => <Object>[bounds];
}

class MoveMapToLocationEvent extends POIsEvent {
  const MoveMapToLocationEvent(this.addressModel);

  final AddressModel addressModel;

  @override
  List<Object> get props => <Object>[addressModel];
}

enum QuickFilters {
  search,
  favorite,
}

class FilterPOIsEvent extends POIsEvent {
  const FilterPOIsEvent(this.filterSelected);

  final String filterSelected;

  @override
  List<Object> get props => <Object>[filterSelected];
}

part of 'pois_bloc.dart';

class POIsState extends Equatable {
  POIsState({
    this.loading = LoadingPois.none,
    this.error,
    this.pois,
    this.quickFilterStatus,
    this.addressModel,
  });

  final LoadingPois loading;
  final dynamic error;
  final List<POIViewModel>? pois;
  final Map<QuickFilters, bool>? quickFilterStatus;
  final AddressModel? addressModel;

  POIsState copyWith({
    LoadingPois? loading,
    dynamic error,
    List<POIViewModel>? pois,
    Map<QuickFilters, bool>? quickFilterStatus,
    AddressModel? addressModel,
  }) {
    return POIsState(
      loading: loading ?? this.loading,
      error: this.error != null ? error : error ?? this.error,
      pois: pois ?? this.pois,
      quickFilterStatus: quickFilterStatus ?? this.quickFilterStatus,
      addressModel: this.addressModel != null
          ? addressModel
          : addressModel ?? this.addressModel,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    loading,
    error,
    pois,
    quickFilterStatus,
    addressModel,
  ];
}

enum LoadingPois { initializing, loading, none }

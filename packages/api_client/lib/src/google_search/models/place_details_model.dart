import 'package:equatable/equatable.dart';

class PlaceDetailsModel extends Equatable {
  const PlaceDetailsModel(this.result, this.status);

  final ResultModel result;
  final String status;

  @override
  List<Object> get props => <Object>[result, status];
}

class ResultModel extends Equatable {
  const ResultModel(
    this.addressComponents,
    this.geometryModel,
    this.formattedAddress,
  );

  final List<AddressComponentsModel> addressComponents;
  final GeometryModel geometryModel;
  final String formattedAddress;

  @override
  List<Object> get props => <Object>[
        addressComponents,
        geometryModel,
        formattedAddress,
      ];
}

class GeometryModel extends Equatable {
  const GeometryModel(
    this.location,
  );

  final LocationModel location;

  @override
  List<Object> get props => <Object>[
        location,
      ];
}

class LocationModel extends Equatable {
  const LocationModel(
    this.lat,
    this.lng,
  );

  final double lat;
  final double lng;

  @override
  List<Object> get props => <Object>[
        lat,
        lng,
      ];
}

class AddressComponentsModel extends Equatable {
  const AddressComponentsModel(
    this.longName,
    this.shortName,
    this.types,
  );

  final String longName;
  final String shortName;
  final List<String> types;

  @override
  List<Object> get props => <Object>[
        longName,
        shortName,
        types,
      ];
}

import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  const LocationModel(this.latitude, this.longitude);
  final double latitude;
  final double longitude;

  @override
  List<Object> get props => <Object>[latitude, longitude];
}

class AddressModel {
  AddressModel(this.addressShort, [this.city, this.country, this.postCode]);
  final String addressShort;
  final String? city;
  final String? country;
  final String? postCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AddressModel &&
              runtimeType == other.runtimeType &&
              addressShort == other.addressShort &&
              city == other.city &&
              country == other.country &&
              postCode == other.postCode;

  @override
  int get hashCode =>
      addressShort.hashCode ^
      city.hashCode ^
      country.hashCode ^
      postCode.hashCode;

  @override
  String toString() {
    return 'AddressModel{addressShort: $addressShort, city: $city, country: $country, postCode: $postCode}';
  }
}

class RouteModel {
  RouteModel(this.routeEncoded, this.routeEncodedTiny);

  final String routeEncoded;
  final String routeEncodedTiny;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is RouteModel &&
              runtimeType == other.runtimeType &&
              routeEncoded == other.routeEncoded &&
              routeEncodedTiny == other.routeEncodedTiny;

  @override
  int get hashCode => routeEncoded.hashCode ^ routeEncodedTiny.hashCode;

  @override
  String toString() {
    return 'RouteModel{routeEncoded: $routeEncoded, routeEncodedTiny: $routeEncodedTiny}';
  }
}

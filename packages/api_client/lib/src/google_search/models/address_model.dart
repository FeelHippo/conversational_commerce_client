import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  const AddressModel(
      this.latitude,
      this.longitude,
      this.address,
      this.postalCode,
      this.city,
      this.streetName,
      this.streetNumber,
      this.country,
      );

  final double latitude;
  final double longitude;
  final String address;
  final String postalCode;
  final String city;
  final String streetName;
  final String streetNumber;
  final String country;

  @override
  List<Object?> get props => <Object?>[
    latitude,
    longitude,
    address,
    postalCode,
    city,
    streetName,
    streetNumber,
    country,
  ];
}

enum AddressType {
  country,
  city,
  street,
}

import 'package:equatable/equatable.dart';

class POIModel extends Equatable {
  const POIModel({
    required this.address,
    required this.city,
    required this.id,
    required this.isActive,
    required this.lat,
    required this.lng,
    required this.name,
    required this.zip,
    required this.iconUrl,
  });

  final String address;
  final String city;
  final int id;
  final bool isActive;
  final double lat;
  final double lng;
  final String name;
  final String zip;
  final String iconUrl;

  @override
  List<Object> get props => <Object>[
        address,
        city,
        id,
        isActive,
        lat,
        lng,
        name,
        zip,
        iconUrl,
      ];
}

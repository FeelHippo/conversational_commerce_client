import 'package:equatable/equatable.dart';

class GoogleLocationModel extends Equatable {
  const GoogleLocationModel({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  List<Object> get props => <Object>[latitude, longitude];
}

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CenterChangeNotifier extends ChangeNotifier {
  bool _isCenterMe = false;
  LatLng? _userPosition;

  bool get isCenterMe => _isCenterMe;
  LatLng? get userPosition => _userPosition;

  void centerMe() {
    _isCenterMe = true;
    notifyListeners();
  }

  void clearCenter() {
    _isCenterMe = false;
    notifyListeners();
  }

  void updateUserPosition(LatLng position) {
    _userPosition = position;
    notifyListeners();
  }
}

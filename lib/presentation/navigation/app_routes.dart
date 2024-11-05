import 'package:flutter/material.dart';
import 'package:apiClient/main.dart';
import 'package:stadtplan/presentation/navigation/app_navigator.dart';
import 'package:stadtplan/presentation/navigation/routes/dashboard.dart';
import 'package:stadtplan/presentation/navigation/routes/onboarding.dart';
import 'package:stadtplan/presentation/navigation/routes/permissions.dart';
import 'package:stadtplan/utils/snackbar_mixin.dart';

// ignore: avoid_classes_with_only_static_members
abstract class AppRoutes {
  //
  // dashboard routes
  static AppRoute<dynamic> dashboard = AppDashboardRoutes.dashboard;

  static AppRoute<dynamic> locationPermissionDeniedScreen({
    required VoidCallback cancelClicked,
    required VoidCallback locationPermissionGranted,
  }) =>
      PermissionsRoutes.locationPermission(
        cancelClicked: cancelClicked,
        locationPermissionGranted: locationPermissionGranted,
      );

  static AppRoute<dynamic> googleSearchAddressScreen(
      {required ValueChanged<AddressModel> onAddressSelected,
        bool checkZipCode = false,
        String? address,
        bool isFromMapScreen = false}) =>
      OnBoardingRoutes.googleSearchAddressScreen(
          onAddressSelected: onAddressSelected,
          checkZipCode: checkZipCode,
          address: address,
          isFromMapScreen: isFromMapScreen,
      );
}

class AppRoute<T> {
  const AppRoute(this.name, {this.routeBuilder});

  final String name;
  final Route<T>? Function(
    BuildContext context,
    SnackBarHandler handler,
    AppNavigator navigator,
  )? routeBuilder;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppRoute<dynamic> &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}

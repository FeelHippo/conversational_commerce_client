import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadtplan/presentation/dashboard_screen/widgets/location_permission_denied_widget.dart';
import 'package:stadtplan/presentation/navigation/app_navigator.dart';
import 'package:stadtplan/presentation/navigation/app_routes.dart';
import 'package:stadtplan/presentation/widgets/routes/custom_popup_route.dart';

// ignore: avoid_classes_with_only_static_members
abstract class PermissionsRoutes {
  static AppRoute<dynamic> locationPermission({
    required VoidCallback cancelClicked,
    required VoidCallback locationPermissionGranted,
  }) =>
      AppRoute<dynamic>(
        'locationPermission',
        routeBuilder: (BuildContext context, _, AppNavigator appNavigator) {
          return CustomPopupRoute<String>(
            isSwipeToDismiss: false,
            widgetBuilder: (_) => Provider<AppNavigator>.value(
              value: appNavigator,
              child: LocationPermissionDeniedWidget(
                cancelClicked: cancelClicked,
                locationPermissionGranted: locationPermissionGranted,
              ),
            ),
          );
        },
      );
}

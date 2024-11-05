import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apiClient/main.dart';
import 'package:stadtplan/presentation/google_search/google_search_address_screen.dart';
import 'package:stadtplan/presentation/navigation/app_navigator.dart';
import 'package:stadtplan/presentation/navigation/app_routes.dart';
import 'package:stadtplan/presentation/widgets/custom_route.dart';
import 'package:stadtplan/presentation/widgets/routes/custom_popup_route.dart';

abstract class OnBoardingRoutes {

  static AppRoute<dynamic> googleSearchAddressScreen(
      {required ValueChanged<AddressModel> onAddressSelected,
        required bool checkZipCode,
        String? address,
        bool isFromMapScreen = false}) =>
      AppRoute<dynamic>(
        'google_search_address_screen',
        routeBuilder: (BuildContext context, _, AppNavigator appNavigator) {
          if (isFromMapScreen) {
            return CustomRoute<String>(
              appNavigator: appNavigator,
              builder: (_) => GoogleSearchAddressScreen(
                onAddressSelected: onAddressSelected,
                checkZipCode: checkZipCode,
                address: address,
                isFromMapScreen: isFromMapScreen,
              ),
            );
          } else {
            return CustomPopupRoute<String>(
              widgetBuilder: (_) => Provider<AppNavigator>.value(
                value: appNavigator,
                child: GoogleSearchAddressScreen(
                  onAddressSelected: onAddressSelected,
                  checkZipCode: checkZipCode,
                  address: address,
                  isFromMapScreen: isFromMapScreen,
                ),
              ),
            );
          }
        },
      );
}

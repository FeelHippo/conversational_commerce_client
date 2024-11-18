import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadtplan/presentation/home_screen/bottom_navigation_controller.dart';
import 'package:stadtplan/utils/snackbar_mixin.dart';

import 'app_routes.dart';

class AppNavigator {
  AppNavigator(
    this.navigatorKey,
    this.bottomNavigationController,
    this.snackBarHandler,
  );

  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavigationController bottomNavigationController;
  final SnackBarHandler snackBarHandler;

  static AppNavigator of(BuildContext context) {
    return context.read<AppNavigator>();
  }

  @optionalTypeArgs
  Future<T?> push<T extends Object?>(AppRoute<T>? appRoute,
      {Object? arguments}) async {
    final bool isNavigatedBackToDashboard = _navigateRootRoutes(appRoute);
    if (isNavigatedBackToDashboard) {
      return null;
    }

    final BuildContext? currentContext = navigatorKey.currentContext;
    if (currentContext == null) {
      Fimber.d('navigator context is null');
      return null;
    }
    final NavigatorState? currentState = navigatorKey.currentState;
    if (currentState == null) {
      Fimber.d('navigator state is null');
      return null;
    }

    final Route<T>? route =
        appRoute?.routeBuilder?.call(currentContext, snackBarHandler, this);
    if (route != null) {
      return currentState.push(route);
    } else {
      Fimber.d('route is null');
    }
    return Future<T>.value();
  }

  Future<T?> pushReplacement<T extends Object?>(AppRoute<T>? appRoute) async {
    final bool isNavigated = _navigateRootRoutes(appRoute);
    if (isNavigated) {
      return null;
    }

    final BuildContext? currentContext = navigatorKey.currentContext;
    if (currentContext == null) {
      Fimber.d('navigator context is null');
      return null;
    }
    final NavigatorState? currentState = navigatorKey.currentState;
    if (currentState == null) {
      Fimber.d('navigator state is null');
      return null;
    }

    final Route<T>? route =
        appRoute?.routeBuilder?.call(currentContext, snackBarHandler, this);
    if (route != null) {
      return navigatorKey.currentState?.pushReplacement(route);
    } else {
      navigatorKey.currentState?.pop();
    }
    return Future<T>.value();
  }

  void pop([dynamic result]) {
    navigatorKey.currentState?.pop(result);
  }

  bool _navigateRootRoutes(AppRoute<dynamic>? appRoute) {
    if (appRoute == AppRoutes.dashboard) {
      popUntilRoot();
      bottomNavigationController.showDashboard();
      return true;
    }
    return false;
  }

  void popUntilRoot() {
    navigatorKey.currentState
        ?.popUntil((Route<dynamic> route) => route.isFirst);
  }

  static void doPopUp(BuildContext context) {
    Navigator.pop(context);
  }
}

import 'package:flutter/material.dart';
import 'package:stadtplan/presentation/widgets/routes/custom_popup_route.dart';

class AppPage<T> extends MaterialPage<T> {
  const AppPage({
    required LocalKey super.key,
    required super.child,
    super.maintainState,
  });
}

class AppPopupPage<T> extends MaterialPage<T> {
  const AppPopupPage({
    required LocalKey super.key,
    required super.child,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return CustomPopupRoute<T>(
      settings: this,
      widgetBuilder: (_) => child,
    );
  }
}

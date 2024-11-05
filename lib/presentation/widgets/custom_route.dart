import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadtplan/presentation/navigation/app_navigator.dart';

class CustomRoute<T> extends PopupRoute<T> {
  CustomRoute(
      {required this.builder, this.appNavigator, this.isProvider = true});

  final WidgetBuilder builder;
  final AppNavigator? appNavigator;
  final bool? isProvider;

  @override
  Color? get barrierColor => null;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  String get barrierLabel => '';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 250);

  @override
  AnimationController createAnimationController() {
    return AnimationController(
      duration: transitionDuration,
      debugLabel: 'CustomPopupRoute',
      vsync: navigator!.overlay!,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: animation.drive(CurveTween(curve: Curves.easeIn)).drive(
            Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ),
          ),
      child: isProvider!
          ? Provider<AppNavigator>.value(
              value: appNavigator!,
              child: child,
            )
          : child,
    );
  }
}

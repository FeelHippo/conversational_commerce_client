import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stadtplan/injector.dart';
import 'package:stadtplan/presentation/dashboard_screen/pois_bloc/pois_bloc.dart';
import 'package:stadtplan/presentation/dashboard_screen/position_bloc/position_bloc.dart';
import 'package:stadtplan/presentation/home_screen/widgets/home_screen.dart';
import 'package:stadtplan/presentation/splash/bloc/splash_bloc.dart';
import 'package:stadtplan/presentation/widgets/custom_navigator.dart';
import 'package:storage/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IOC>(
      builder: (BuildContext context, IOC ioc, Widget? child) {
        return MultiBlocProvider(
          providers: <SingleChildWidget>[
            BlocProvider<SplashBloc>(
              create: (BuildContext context) {
                return ioc.getDependency<SplashBloc>();
              },
            ),
            BlocProvider<PositionBloc>(
              create: (BuildContext context) {
                return ioc.getDependency<PositionBloc>();
              },
            ),
            BlocProvider<POIsBloc>(
              create: (BuildContext context) {
                return ioc.getDependency<POIsBloc>();
              },
            ),
          ],
          child: Consumer<IOC>(
            builder: (BuildContext context, IOC ioc, Widget? child) {
              final GlobalKey<NavigatorState> rootNavigatorKey =
                  GlobalKey<NavigatorState>();
              return CustomNavigator(
                navigatorKey: rootNavigatorKey,
                onGenerateRoute: (_) => PageRouteBuilder<dynamic>(
                  pageBuilder: (_, __, ___) => HomeScreen(
                    rootNavigatorKey: rootNavigatorKey,
                    userPreferences: ioc.getDependency<UserPreferences>(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stadtplan/injector.dart';
import 'package:stadtplan/presentation/dashboard_screen/pois_bloc/pois_bloc.dart';
import 'package:stadtplan/presentation/dashboard_screen/utils/marker_utils.dart';
import 'package:stadtplan/presentation/dashboard_screen/widgets/dashboard_widget.dart';
import 'package:stadtplan/presentation/navigation/app_navigator.dart';
import 'package:stadtplan/presentation/widgets/app_scaffold.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:apiClient/main.dart';
import 'package:storage/main.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      systemUiOverlayStyleIOS: SystemUiOverlayStyle.dark,
      body: Consumer<IOC>(
        builder: (BuildContext context, IOC ioc, Widget? child) {
          final MarkerUtils markerImageUtils = ioc.getDependency<MarkerUtils>();
          PositionInteractor positionInteractor =
            ioc.getDependency<PositionInteractor>();
          final UserPreferences userPreferences =
              ioc.getDependency<UserPreferences>();

          // TODO:
          // create a position bloc, that every n seconds reads the user's position
          // initialise the bloc here, and add the init event to read user position
          // remove positionInteractor from here down the widget tree

          // in MapWidget, add a bloc consumer to have the user position available

          return DashboardWidget(
            markerImageUtils: markerImageUtils,
            positionInteractor: positionInteractor,
            userPreferences: userPreferences,
          );
        },
      ),
    );
  }
}
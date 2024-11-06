import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stadtplan/injector.dart';
import 'package:stadtplan/presentation/dashboard_screen/utils/marker_utils.dart';
import 'package:stadtplan/presentation/dashboard_screen/widgets/dashboard_widget.dart';
import 'package:stadtplan/presentation/widgets/app_scaffold.dart';
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
          final UserPreferences userPreferences =
              ioc.getDependency<UserPreferences>();

          return DashboardWidget(
            markerImageUtils: markerImageUtils,
            userPreferences: userPreferences,
          );
        },
      ),
    );
  }
}

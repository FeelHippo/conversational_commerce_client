import 'dart:async';
import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:stadtplan/utils/google_services/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stadtplan/injector.dart';
import 'package:stadtplan/presentation/splash/splash_screen.dart';
import 'package:stadtplan/presentation/widgets/scope_widget.dart';
import 'package:stadtplan/themes/theme.dart';
import 'package:stadtplan/utils/dashboard_controller.dart';
import 'package:stadtplan/utils/google_services/google_maps.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {

      WidgetsFlutterBinding.ensureInitialized();

      await setUp();

      DashboardController.preserve();

      final IOC ioc = IOC.appScope();

      runApp(
        AutoSenseApp(scope: ioc),
      );

      Bloc.observer = SimpleBlocDelegate();
      DashboardController.remove();
    },
    (Object error, StackTrace stackTrace) => Fimber.e('$error, $stackTrace'),
  );
}

Future<void> setUp() async {
  await dotenv.load(
    fileName: '.env',
    mergeWith: Platform.environment,
  );
  await Permission.location.request();
  await initFirebase();
  await initGoogleMaps();
}

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}

class AutoSenseApp extends StatelessWidget {
  const AutoSenseApp({super.key, required this.scope});
  final IOC scope;

  @override
  Widget build(BuildContext context) {
    return ScopeWidget(
      scope: scope,
      child: MaterialApp(
        theme: AppTheme.androidTheme(),
        home: const SplashScreen(),
      ),
    );
  }
}

import 'dart:async';

import 'package:conversational_commerce/injector.dart';
import 'package:conversational_commerce/presentation/splash/splash_screen.dart';
import 'package:conversational_commerce/presentation/widgets/scope_widget.dart';
import 'package:conversational_commerce/themes/theme.dart';
import 'package:conversational_commerce/utils/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      DashboardController.preserve();

      final IOC ioc = IOC.appScope();

      runApp(
        ChatToolApp(scope: ioc),
      );

      Bloc.observer = SimpleBlocDelegate();
      DashboardController.remove();
    },
    (Object error, StackTrace stackTrace) => print('$error, $stackTrace'),
  );
}

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType} error: ${error}');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    print('onClose -- ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}

class ChatToolApp extends StatelessWidget {
  const ChatToolApp({super.key, required this.scope});
  final IOC scope;

  @override
  Widget build(BuildContext context) {
    return ScopeWidget(
      scope: scope,
      child: MaterialApp(
        theme: AppTheme.lightTheme(),
        home: const SplashScreen(),
      ),
    );
  }
}

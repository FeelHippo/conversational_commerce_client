import 'package:conversational_commerce/bloc/bloc.dart';
import 'package:conversational_commerce/injector.dart';
import 'package:conversational_commerce/presentation/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IOC>(
      builder: (BuildContext context, IOC ioc, Widget? child) {
        return MultiBlocProvider(
          providers: <SingleChildWidget>[
            BlocProvider<MessageBloc>(
              create: (BuildContext context) {
                return ioc.getDependency<MessageBloc>();
              },
            ),
          ],
          child: ChatScreen(),
        );
      },
    );
  }
}

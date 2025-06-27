import 'package:conversational_commerce/bloc/bloc.dart';
import 'package:conversational_commerce/presentation/chat/chat_widget.dart';
import 'package:conversational_commerce/presentation/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late MessageBloc messageBloc;
  late TextEditingController chatController;

  @override
  void initState() {
    super.initState();
    messageBloc = BlocProvider.of<MessageBloc>(context);
    chatController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
        body: ChatWidget(
          messageBloc: messageBloc,
          chatController: chatController,
        ),
      );
}

import 'package:conversational_commerce/bloc/bloc.dart';
import 'package:conversational_commerce/models/message_model.dart';
import 'package:conversational_commerce/themes/constants/spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.messageBloc,
    required this.chatController,
  });

  final MessageBloc messageBloc;
  final TextEditingController chatController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageBloc, MessageState>(
      bloc: messageBloc,
      builder: (BuildContext context, MessageState state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
            left: Spacings.medium,
            right: Spacings.medium,
            top: Spacings.xxxxLarge,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - Spacings.huge,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ...state.messages.map(
                        (MessageModel model) => Container(
                          width: MediaQuery.of(context).size.width -
                              Spacings.xLarge,
                          padding: EdgeInsets.all(
                            Spacings.medium,
                          ),
                          margin: EdgeInsets.only(
                            bottom: Spacings.small,
                            right: model.type == MessageType.agent
                                ? Spacings.large
                                : 0,
                            left: model.type == MessageType.user
                                ? Spacings.large
                                : 0,
                          ),
                          decoration: BoxDecoration(
                            color: model.type == MessageType.user
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                Spacings.xxLarge,
                              ),
                            ),
                          ),
                          child: Text(
                            model.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: Spacings.xLarge,
                child: Container(
                  width: MediaQuery.of(context).size.width - Spacings.xLarge,
                  padding: EdgeInsets.all(
                    Spacings.medium,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Spacings.xxLarge,
                      ),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: chatController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: state.messages.isEmpty
                                ? '“where’s my order”...'
                                : null,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: ElevatedButton(
                          onPressed: () {
                            if (chatController.text.isNotEmpty) {
                              messageBloc.add(
                                NewMessageEvent(
                                  message: chatController.text,
                                ),
                              );
                              chatController.text = '';
                            }
                          },
                          child: state.loading == Loading.loading
                              ? CircularProgressIndicator()
                              : Icon(
                                  Icons.send,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(Spacings.medium),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

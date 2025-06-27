import 'dart:async';

import 'package:apiClient/main.dart';
import 'package:conversational_commerce/models/message_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc({
    required this.messagesService,
  }) : super(const MessageState()) {
    on<NewMessageEvent>(_handleNewMessageEvent);
  }

  final MessagesService messagesService;

  Future<FutureOr<void>> _handleNewMessageEvent(
    NewMessageEvent event,
    Emitter<MessageState> emit,
  ) async {
    // add latest user message, update the UI
    emit(
      state.copyWith(
        loading: Loading.loading,
        message: MessageModel(
          type: MessageType.user,
          text: event.message,
        ),
      ),
    );
    try {
      // call the AI agent
      final String response =
          await messagesService.postNewMessage(messages: <String>[
        ...state.messages
            .where(
              (MessageModel model) => model.type == MessageType.user,
            )
            .map(
              (MessageModel model) => model.text,
            ),
      ]);

      // add latest agent message, update the UI
      emit(
        state.copyWith(
          loading: Loading.none,
          message: MessageModel(
            type: MessageType.agent,
            text: response,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loading: Loading.none,
          error: 'Network Error',
        ),
      );
    }
  }
}

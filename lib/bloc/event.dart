part of 'bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();
}

class NewMessageEvent extends MessageEvent {
  const NewMessageEvent({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => <Object>[message];
}

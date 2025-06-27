import 'package:equatable/equatable.dart';

enum MessageType {
  user,
  agent,
}

class MessageModel extends Equatable {
  const MessageModel({required this.type, required this.text});

  final MessageType type;
  final String text;

  @override
  List<Object?> get props => <Object?>[
        type,
        text,
      ];
}

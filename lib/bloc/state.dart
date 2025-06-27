part of 'bloc.dart';

enum Loading { initializing, loading, none }

class MessageState extends Equatable {
  const MessageState({
    this.loading = Loading.initializing,
    this.error,
    this.messages = const <MessageModel>[],
  });

  final Loading loading;
  final String? error;
  final List<MessageModel> messages;

  MessageState copyWith({
    Loading? loading,
    String? error,
    MessageModel? message,
  }) {
    return MessageState(
      error: error,
      loading: loading ?? this.loading,
      messages: message != null
          ? <MessageModel>[...this.messages, message]
          : this.messages,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        loading,
        error,
        messages,
      ];
}

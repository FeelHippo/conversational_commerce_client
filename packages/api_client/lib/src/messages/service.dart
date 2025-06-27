import 'package:apiClient/main.dart';

class MessagesService {
  const MessagesService({
    required this.messagesProvider
});

  final MessagesProvider messagesProvider;

  Future<String> postNewMessage({required List<String> messages}) async {
    return messagesProvider.postNewMessage(messages: messages);
  }
}
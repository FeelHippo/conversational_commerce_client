import 'package:apiClient/main.dart';

class MessagesNetworkInterface extends MessagesProvider {
  MessagesNetworkInterface({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<String> postNewMessage({required List<String> messages}) async {
    return apiClient.postNewMessage(
      request: ChatMessagesRequest(
        messages: messages,
      ),
    );
  }
}

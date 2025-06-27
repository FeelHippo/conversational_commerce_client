import 'package:apiClient/src/requests/chat_messages_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;
  // Posts user's chat messages to the AI agent
  @GET('/')
  Future<String> postNewMessage({
    @Body() required ChatMessagesRequest request,
  });
}

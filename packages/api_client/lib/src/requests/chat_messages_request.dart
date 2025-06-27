import 'package:json_annotation/json_annotation.dart';

part 'chat_messages_request.g.dart';

@JsonSerializable()
class ChatMessagesRequest {
  ChatMessagesRequest({
    required this.messages,
  });

  final List<String> messages;

  factory ChatMessagesRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatMessagesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessagesRequestToJson(this);
}

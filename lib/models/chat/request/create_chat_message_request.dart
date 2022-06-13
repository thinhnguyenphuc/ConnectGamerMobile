import 'package:json_annotation/json_annotation.dart';

part '../../generated/chat/request/create_chat_message_request.g.dart';

@JsonSerializable()
class CreateChatMessageRequest {
  String roomId;
  String message;
  String localId;

  CreateChatMessageRequest(this.roomId, this.message, this.localId);

  factory CreateChatMessageRequest.fromJson(Map<String, dynamic> json) => _$CreateChatMessageRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateChatMessageRequestToJson(this);
}
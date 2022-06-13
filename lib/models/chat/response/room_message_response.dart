import 'package:json_annotation/json_annotation.dart';

import 'chat_message_response.dart';

part '../../generated/chat/response/room_message_response.g.dart';

@JsonSerializable()
class RoomMessageResponse {
  String roomId;
  List<ChatMessageResponse> messages;

  RoomMessageResponse(this.roomId, this.messages);

  factory RoomMessageResponse.fromJson(Map<String, dynamic> json) => _$RoomMessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RoomMessageResponseToJson(this);
}

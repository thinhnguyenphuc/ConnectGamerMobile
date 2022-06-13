import 'package:json_annotation/json_annotation.dart';

part '../../generated/chat/request/chat_room_edit_request.g.dart';

@JsonSerializable()
class ChatRoomEditRequest {
  String roomId;
  String roomName;

  ChatRoomEditRequest(this.roomId, this.roomName);

  factory ChatRoomEditRequest.fromJson(Map<String, dynamic> json) => _$ChatRoomEditRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRoomEditRequestToJson(this);
}
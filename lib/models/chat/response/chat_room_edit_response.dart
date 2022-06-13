import 'package:connectgamermobile/models/chat/response/chat_room_simplify_info_response.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/chat/response/chat_room_edit_response.g.dart';

@JsonSerializable()
class ChatRoomEditResponse {
  String roomId;
  String name;
  ChatRoomSimplifyInfoResponse roomInfo;

  ChatRoomEditResponse(this.roomId, this.name, this.roomInfo);

  factory ChatRoomEditResponse.fromJson(Map<String, dynamic> json) => _$ChatRoomEditResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRoomEditResponseToJson(this);
}
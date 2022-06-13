import 'package:connectgamermobile/models/chat/response/chat_room_full_info_response.dart';
import 'package:connectgamermobile/models/user/user_minimized_info.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/chat/response/room_users_edit_response.g.dart';

@JsonSerializable()
class RoomUsersEditResponse {
  String roomId;
  List<UserMinimizedInfo> users;

  ChatRoomFullInfoResponse roomInfo;

  RoomUsersEditResponse(this.roomId, this.users, this.roomInfo);

  factory RoomUsersEditResponse.fromJson(Map<String, dynamic> json) => _$RoomUsersEditResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RoomUsersEditResponseToJson(this);
}
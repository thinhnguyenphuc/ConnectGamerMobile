import 'package:json_annotation/json_annotation.dart';

part '../../generated/chat/request/room_users_edit_request.g.dart';

@JsonSerializable()
class RoomUsersEditRequest {
  List<String> userNames;

  RoomUsersEditRequest(this.userNames);

  factory RoomUsersEditRequest.fromJson(Map<String, dynamic> json) => _$RoomUsersEditRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RoomUsersEditRequestToJson(this);
}
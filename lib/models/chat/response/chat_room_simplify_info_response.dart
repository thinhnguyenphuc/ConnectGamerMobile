import 'package:json_annotation/json_annotation.dart';

part '../../generated/chat/response/chat_room_simplify_info_response.g.dart';

@JsonSerializable()
class ChatRoomSimplifyInfoResponse {
  String id;
  String name;
  String? avatar;

  ChatRoomSimplifyInfoResponse(this.id, this.name, this.avatar);

  factory ChatRoomSimplifyInfoResponse.fromJson(Map<String, dynamic> json) => _$ChatRoomSimplifyInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRoomSimplifyInfoResponseToJson(this);
}
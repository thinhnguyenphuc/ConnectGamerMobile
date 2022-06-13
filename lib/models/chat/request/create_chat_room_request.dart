import 'package:json_annotation/json_annotation.dart';

part '../../generated/chat/request/create_chat_room_request.g.dart';

@JsonSerializable()
class CreateChatRoomRequest {
  String? name;
  List<String> userNames;

  CreateChatRoomRequest(this.name, this.userNames);

  factory CreateChatRoomRequest.fromJson(Map<String, dynamic> json) => _$CreateChatRoomRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateChatRoomRequestToJson(this);
}
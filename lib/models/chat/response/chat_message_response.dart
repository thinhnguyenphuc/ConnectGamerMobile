import 'package:connectgamermobile/models/chat/response/chat_room_full_info_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_simplify_info_response.dart';
import 'package:connectgamermobile/models/user/user_minimized_info.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/chat/response/chat_message_response.g.dart';

@JsonSerializable()
class ChatMessageResponse {
  String roomId;
  String message;
  String messageType;
  UserMinimizedInfo sender;
  String? localId;
  ChatRoomFullInfoResponse? roomInfo;

  ///UTC
  DateTime createdAt;

  ///Oldest message of day
  @JsonKey(ignore: true)
  bool isLastOfDay = false;

  ///Newest message of day
  @JsonKey(ignore: true)
  bool isFirstOfDay = false;

  @JsonKey(ignore: true)
  MessageState state = MessageState.verified;

  ChatMessageResponse(
      this.roomId, this.message, this.messageType, this.sender, this.createdAt, this.localId, this.roomInfo);

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) => _$ChatMessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageResponseToJson(this);
}

enum MessageState {
  waiting,
  verified,
  error
}
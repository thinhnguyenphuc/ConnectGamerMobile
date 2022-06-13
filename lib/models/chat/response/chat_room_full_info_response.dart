import 'package:connectgamermobile/models/chat/response/chat_message_response.dart';
import 'package:connectgamermobile/models/user/user_minimized_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../resources/strings.dart';

part '../../generated/chat/response/chat_room_full_info_response.g.dart';

@JsonSerializable()
class ChatRoomFullInfoResponse {
  String id;
  String name;
  String? avatar;
  List<UserMinimizedInfo>? users;

  ///1: Private
  ///2: Group
  int type;

  ///For displaying closest message
  List<ChatMessageResponse>? messages;
  String? roomMasterName;

  ChatRoomFullInfoResponse(this.id, this.name, this.avatar, this.users,
      this.type, this.messages, this.roomMasterName) {
    messages ??= [];
  }

  factory ChatRoomFullInfoResponse.fromJson(Map<String, dynamic> json) => _$ChatRoomFullInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRoomFullInfoResponseToJson(this);

  factory ChatRoomFullInfoResponse.createPseudo(String id, UserMinimizedInfo user1, UserMinimizedInfo user2) {
    return ChatRoomFullInfoResponse(id, "", null, [user1,user2], 1, [], "");
  }

  String _getAlternateName() {
    return users?.where((user) => user.userName != Strings.testUsername).map((e) => e.displayName ?? e.userName).toList().join(", ") ?? "";
  }

  bool get isPrivate {
    return type == 1;
  }

  List<String> get userNames {
    return users?.map((e) => e.userName).toList() ?? [];
  }

  static List<ChatRoomFullInfoResponse> demo(int currentPage, int itemPerPage) {
    debugPrint(currentPage.toString());
    return List.generate(itemPerPage, (index) => ChatRoomFullInfoResponse((index + (currentPage * index)).toString(), "name${(index + currentPage * index).toString()}", null, [UserMinimizedInfo("nnhuynh306", null, null), UserMinimizedInfo("test2", null, null),  UserMinimizedInfo("test3", null, null)], 2, [], ""));
  }
}
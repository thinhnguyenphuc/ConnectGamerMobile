import 'dart:convert';

import 'package:connectgamermobile/data/network/api/chat_api.dart';
import 'package:connectgamermobile/data/repositories/commons/handle_response_mixin.dart';
import 'package:connectgamermobile/data/repositories/commons/handle_signalr_mixin.dart';
import 'package:connectgamermobile/data/repositories/commons/paging_repository_mixin.dart';
import 'package:connectgamermobile/models/chat/request/chat_pagination_request.dart';
import 'package:connectgamermobile/models/chat/request/chat_room_edit_request.dart';
import 'package:connectgamermobile/models/chat/request/create_chat_message_request.dart';
import 'package:connectgamermobile/models/chat/request/create_chat_room_request.dart';
import 'package:connectgamermobile/models/chat/request/room_users_edit_request.dart';
import 'package:connectgamermobile/models/chat/response/chat_message_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_edit_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_full_info_response.dart';
import 'package:connectgamermobile/models/chat/response/room_message_response.dart';
import 'package:connectgamermobile/models/chat/response/room_users_edit_response.dart';
import 'package:connectgamermobile/models/commons/pagination.dart';
import 'package:connectgamermobile/models/commons/paging_response.dart';
import 'package:connectgamermobile/resources/strings.dart';
class ChatRepository with HandlePagingResponseMixin, HandleResponseMixin, HandleSignalRMixin {
  Future<PagingResponse<ChatRoomFullInfoResponse>?> loadAllChatRoom(
      PaginationRequest paginationRequest, [String name = ""]) async {

    return handlePagingResponse(await ChatApi.loadAllChatRoom(paginationRequest, name), (jsonT) =>
        ChatRoomFullInfoResponse.fromJson(jsonT as Map<String, dynamic>));
  }

  Future<ChatRoomFullInfoResponse?> addChatRoom(CreateChatRoomRequest request) async {
    return handleResponse(await ChatApi.addChatRoom(request), (json) => ChatRoomFullInfoResponse.fromJson(json));
  }

  Future<RoomMessageResponse?> loadMessages(String roomId, ChatPaginationRequest request) async {
    return handleResponse(await ChatApi.loadMessages(roomId, request), (json) => RoomMessageResponse.fromJson(json));
  }

  Future<ChatMessageResponse?> sendMessage(CreateChatMessageRequest request) async {
    return handleResponse(await ChatApi.sendMessage(request), (json) => ChatMessageResponse.fromJson(json));
  }

  Future<ChatRoomEditResponse?> editRoomName(ChatRoomEditRequest request) async {
    return handleResponse(await ChatApi.editRoomName(request), (json) => ChatRoomEditResponse.fromJson(json));
  }

  Future<RoomUsersEditResponse?> addUsersToChatRoom(String roomId, RoomUsersEditRequest request) async {
    return handleResponse(await ChatApi.addUserToChatRoom(roomId, request), (json) => RoomUsersEditResponse.fromJson(json));
  }

  Future<RoomUsersEditResponse?> removeUsersFromChatRoom(String roomId, RoomUsersEditRequest request) async {
    return handleResponse(await ChatApi.removeUserFromChatRoom(roomId, request), (json) => RoomUsersEditResponse.fromJson(json));
  }

  void onNewRoom(void Function(ChatRoomFullInfoResponse roomInfo) handleResponse) {
    onSignalRJsonData(SignalRMethodNames.newRoom, handleResponse, (json) => ChatRoomFullInfoResponse.fromJson(json));
  }

  void onRoomNameChanged(void Function(ChatRoomEditResponse response) handleResponse) {
    onSignalRJsonData(SignalRMethodNames.roomNameChanged, handleResponse, (json) => ChatRoomEditResponse.fromJson(json));
  }

  void onUsersAddedToChatRoom(void Function(RoomUsersEditResponse response) handleResponse) {
    onSignalRJsonData(SignalRMethodNames.usersAddedToChatRoom, handleResponse, (json) => RoomUsersEditResponse.fromJson(json));
  }

  void onUsersRemovedFromChatRoom(void Function(RoomUsersEditResponse response) handleResponse) {
    onSignalRJsonData(SignalRMethodNames.usersRemovedFromChatRoom, handleResponse, (json) => RoomUsersEditResponse.fromJson(json));
  }

  void onNewMessage(void Function(ChatMessageResponse response) handleResponse) {
    onSignalRJsonData(SignalRMethodNames.newMessage, handleResponse, (json) => ChatMessageResponse.fromJson(json));
  }
}

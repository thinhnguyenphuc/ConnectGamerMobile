import 'dart:async';

import 'package:connectgamermobile/data/network/signalr/signalr_controller.dart';
import 'package:connectgamermobile/data/repositories/chat_repository.dart';
import 'package:connectgamermobile/models/chat/request/create_chat_room_request.dart';
import 'package:connectgamermobile/models/chat/response/chat_message_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_full_info_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_simplify_info_response.dart';
import 'package:connectgamermobile/models/commons/pagination.dart';
import 'package:connectgamermobile/models/commons/paging_response.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/view_models/common/notification_controller.dart';
import 'package:flutter/cupertino.dart';
import '../../models/chat/response/chat_room_edit_response.dart';
import '../../models/chat/response/room_users_edit_response.dart';
import '../../models/user/user_minimized_info.dart';
import '../../utils/message.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:collection/collection.dart';

import '../common/int_scroll_pagination.dart';

class ChatHomePageViewModel extends IntScrollPaginationViewModel<ChatRoomFullInfoResponse> {

  final ChatRepository _chatRepository = ChatRepository();

  int addingRoomCount = 0;

  @override
  // TODO: implement itemPerPage
  int get itemPerPage => 15;

  ///context for showing snackbar
  BuildContext context;

  late final AppLocalizations l10n = AppLocalizations.of(context)!;

  bool get isAddingRoom {
    return addingRoomCount > 0;
  }

  final List<String> _newlyAddedRoomIds = [];

  String userName;

  String searchUserName = "";
  
  ValueNotifier<ChatRoomFullInfoResponse>? currentRoomNotifier;

  ChatHomePageViewModel(this.context, this.userName) {
    _onSignalR();
  }

  Future<ChatRoomFullInfoResponse?> addChatRoom(String? name, List<String> userNames) async {
    addingRoomCount++;
    notifyListeners();

    final result = await _chatRepository.addChatRoom(CreateChatRoomRequest(name, userNames));

    addingRoomCount--;
    notifyListeners();

    _handleNewRoom(result);

    return result;
  }

  void search(String userName) {
    if (userName != searchUserName) {
      searchUserName = userName;
      refresh();
    }
  }

  @override
  void refresh() {
    _newlyAddedRoomIds.clear();
    super.refresh();
  }

  void _onSignalR() {
    _chatRepository.onNewRoom(_handleNewRoom);
    _chatRepository.onRoomNameChanged(_handleRoomNameChanged);
    _chatRepository.onUsersAddedToChatRoom(_handleUsersAddedToChatRoom);
    _chatRepository.onUsersRemovedFromChatRoom(_handleUsersRemovedFromChatRoom);
    _chatRepository.onNewMessage(_handleNewMessage);
  }

  void _offSignalR() {
    _chatRepository.offSignalR();
  }

  void _handleNewRoom(ChatRoomFullInfoResponse? data) {
    if (data != null) {
      if (!_newlyAddedRoomIds.contains(data.id)) {
        _insertNewChatRoom(data);
        NotificationController().onNewRoom(context, data);
      }
    }
  }

  ///insert at the start
  void _insertNewChatRoom(ChatRoomFullInfoResponse data) {
    _newlyAddedRoomIds.add(data.id);
    pagingController.itemList?.insert(0, data);
    pagingController.notifyListeners();
  }

  ///insert at the start
  void _insertNewChatRoomByMessage(ChatMessageResponse message) {
    if (message.roomInfo != null) {
      message.roomInfo!.messages!.insert(0, message);
      _insertNewChatRoom(message.roomInfo!);
    }
  }

  ///add to last
  void _addNewChatRoom(ChatRoomFullInfoResponse data) {
    _newlyAddedRoomIds.add(data.id);
    pagingController.itemList?.add(data);
    pagingController.notifyListeners();
  }

  ///assume [roomId] must already exist
  void _moveChatRoomToFirstIndex(String roomId, Function(ChatRoomFullInfoResponse roomInfo)? actOnRoom) {
    var room = pagingController.itemList?.firstWhere((element) => element.id == roomId);
    if (room != null) {
      actOnRoom?.call(room);
      pagingController.itemList?.removeWhere((element) => element.id == roomId);
      pagingController.itemList?.insert(0, room);
      pagingController.notifyListeners();
    }
  }

  @override
  void dispose() {
    _offSignalR();

    super.dispose();
  }
  
  @override
  List<ChatRoomFullInfoResponse> preProcessData(List<ChatRoomFullInfoResponse> data) {
    data.removeWhere((element) => _newlyAddedRoomIds.contains(element.id));
    return data;
  }

  @override
  Future<PagingResponse<ChatRoomFullInfoResponse>?> fetchResponse(int pageKey) {
    return _chatRepository.loadAllChatRoom(PaginationRequest(pageKey, itemPerPage), searchUserName);
  }
  
  ///Create a value notifier to keep room info in room page up to date
  ValueNotifier<ChatRoomFullInfoResponse> enterRoom(ChatRoomFullInfoResponse room) {
    currentRoomNotifier = ValueNotifier(room);
    return currentRoomNotifier!;
  }

  ///If private room exit (already load), behave like normal,
  ///else add this private room to the end and mark it at unordered
  ValueNotifier<ChatRoomFullInfoResponse> enterPrivateRoom(ChatRoomFullInfoResponse pseudoRoom) {
    if (_roomExists(pseudoRoom.id)) {
      return enterRoom(_findRoomInfo(pseudoRoom.id)!);
    } else {
      return enterRoom(pseudoRoom);
    }
  }

  void exitRoom() {
    currentRoomNotifier?.dispose();
    currentRoomNotifier = null;
  }

  void _handleUsersAddedToChatRoom(RoomUsersEditResponse response) {

    final userNames = response.users.map((e) => e.userName).toList();

    if (userNames.contains(userName)) {
      //Added to room;
      _insertNewChatRoom(response.roomInfo);

      NotificationController().onAddedToChatRoom(context, response.roomInfo);
    } else {
      final roomInfo = _findRoomInfo(response.roomId);

      if (roomInfo != null) {
        roomInfo.users?.addAll(response.users);
        _tryNotifyCurrentChatRoom(roomInfo.id);
      }

      NotificationController().onUsersAddedToChatRoom(context, roomInfo ?? response.roomInfo, response.users);
    }
  }

  void _handleUsersRemovedFromChatRoom(RoomUsersEditResponse response) {

    final userNames = response.users.map((e) => e.userName).toList();

    if (userNames.contains(userName)) {
      //Kicked out of room;
      pagingController.itemList?.removeWhere((element) => element.id == response.roomId);
      pagingController.notifyListeners();

      NotificationController().onRemovedFromChatRoom(context, response.roomInfo);
    } else {
      final roomInfo = _findRoomInfo(response.roomId);

      if (roomInfo != null) {
        roomInfo.users?.removeWhere((element) => userNames.contains(element.userName));
        _tryNotifyCurrentChatRoom(roomInfo.id);
      }

      NotificationController().onUsersRemovedFromChatRoom(context, roomInfo ?? response.roomInfo, response.users);
    }

    _tryNotifyCurrentChatRoom(response.roomId);
  }

  void _tryNotifyCurrentChatRoom(String roomId) {
    if (currentRoomNotifier != null && currentRoomNotifier!.value.id == roomId) currentRoomNotifier!.notifyListeners();
  }

  void _handleRoomNameChanged(ChatRoomEditResponse response) {

    final roomInfo = _findRoomInfo(response.roomId);
    if (roomInfo == null) return;

    roomInfo.name = response.name;
    _tryNotifyCurrentChatRoom(roomInfo.id);

    notifyListeners();

    NotificationController().onRoomInfoChanged(context, response.roomInfo);
  }

  ChatRoomFullInfoResponse? _findRoomInfo(String roomId) {
    return pagingController.itemList?.firstWhereOrNull((element) => element.id == roomId);
  }

  void _handleNewMessage(ChatMessageResponse response) {
    _reOrderChatRoomOnNewMessage(response);

    if (response.roomId != currentRoomNotifier?.value.id && response.sender.userName != userName) {
      NotificationController().onNewMessage(context, response);
    }
  }
  
  void _reOrderChatRoomOnNewMessage(ChatMessageResponse response) {
    if (_roomExists(response.roomId)) {
      _moveChatRoomToFirstIndex(response.roomId, (roomInfo) {
        roomInfo.messages = [response];
      });
    } else {
      _insertNewChatRoomByMessage(response);
    }
  }

  bool _roomExists(String roomId) {
    return pagingController.itemList?.map((e) => e.id).contains(roomId) ?? false;
  }
}
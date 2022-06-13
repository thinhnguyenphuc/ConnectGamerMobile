import 'package:connectgamermobile/custom_classes/extensions/navigator_extension.dart';
import 'package:connectgamermobile/data/network/signalr/signalr_controller.dart';
import 'package:connectgamermobile/data/repositories/chat_repository.dart';
import 'package:connectgamermobile/models/chat/request/chat_pagination_request.dart';
import 'package:connectgamermobile/models/chat/request/chat_room_edit_request.dart';
import 'package:connectgamermobile/models/chat/request/create_chat_message_request.dart';
import 'package:connectgamermobile/models/chat/request/room_users_edit_request.dart';
import 'package:connectgamermobile/models/chat/response/chat_message_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_edit_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_full_info_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_simplify_info_response.dart';
import 'package:connectgamermobile/models/chat/response/room_users_edit_response.dart';
import 'package:connectgamermobile/models/user/user_minimized_info.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/utils/dialog.dart';
import 'package:connectgamermobile/utils/message.dart';
import 'package:connectgamermobile/view_models/common/fetch_state.dart';
import 'package:connectgamermobile/view_models/common/scroll_pagination.dart';
import 'package:connectgamermobile/widgets/controllers/multi_select_controller.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatRoomViewModel extends ScrollPaginationViewModel<DateTime, ChatMessageResponse> {

  ///This section is for ChatRoomPage

  final ChatRepository _chatRepository = ChatRepository();

  final ValueNotifier<ChatRoomFullInfoResponse> roomInfoNotifier;

  late final ChatRoomFullInfoResponse roomInfo = roomInfoNotifier.value;

  final String userName;

  final BuildContext context;
  
  late final AppLocalizations l10n = AppLocalizations.of(context)!;

  ChatRoomViewModel(this.roomInfoNotifier, this.userName, this.context): super() {
    roomInfoNotifier.addListener(_onRoomInfoChanged);
    _onSignalR();
  }

  List<String> _waitingResponseLocalId = [];

  @override
  DateTime getFirstPageKey() {
    return DateTime.now().toUtc();
  }

  @override
  DateTime getNextPageKey(DateTime currentPageKey, List<ChatMessageResponse> appendedData) {
    return appendedData.isNotEmpty ? appendedData.last.createdAt.toUtc(): currentPageKey;
  }

  @override
  bool isLastPageByData(List<ChatMessageResponse> data) {
    return data.isEmpty;
  }

  @override
  bool isLastPageByKey(DateTime currentPageKey) {
    return false;
  }

  @override
  Future<List<ChatMessageResponse>?> loadNewPage(DateTime pageKey) async {
    var response = await _chatRepository.loadMessages(roomInfo.id, ChatPaginationRequest(pageKey, itemPerPage));

    if (response != null && response.roomId == roomInfo.id) {
      if (roomInfo.messages!.isEmpty && response.messages.isNotEmpty) {
        roomInfo.messages!.add(response.messages.last);
        roomInfoNotifier.notifyListeners();
      }
      return response.messages;
    } else {
      return null;
    }
  }

  @override
  List<ChatMessageResponse> preProcessData(List<ChatMessageResponse> data) {
    data = data.reversed.toList();
    final lastAddedMessage = getLastData();

    if (lastAddedMessage != null) data.insert(0, lastAddedMessage);

    //Check if the next older message has different date than current checking message
    //If true => the current message must be the last message of its day
    for (int i = 0; i < data.length - 1; i++) {
      final message = data[i];
      final nextMessage = data[i + 1];

      _checkLastOrFirstOfDay(message, nextMessage);
    }

    //the last message will always the last message of its date
    //when fetching new data. this last message will be added to check again.
    if (data.isNotEmpty) data[data.length - 1].isLastOfDay = true;

    if (lastAddedMessage != null) {
      data = data..removeAt(0);
    }

    return data;
  }

  void _checkLastOrFirstOfDay(ChatMessageResponse message, ChatMessageResponse nextMessage) {
    if (DateUtils.isSameDay(message.createdAt.toLocal(), nextMessage.createdAt.toLocal())) {
      message.isLastOfDay = false;

      nextMessage.isFirstOfDay = false;
    } else {
      message.isLastOfDay = true;

      nextMessage.isFirstOfDay = true;
    }
  }

  bool isOldestMessageOfUser(ChatMessageResponse item, int index) {
    return _checkNewestOrOldestMessageOfUser(item, index, index + 1, item.isLastOfDay);
  }

  bool isNewestMessageOfUser(ChatMessageResponse item, int index) {
    return _checkNewestOrOldestMessageOfUser(item, index, index - 1, item.isFirstOfDay);
  }

  ///[oldestOrNewestItem] last for checking last message, etc...
  ///[checkIndex] is [index] -1 for newest message, and [index] +1 for oldest message
  bool _checkNewestOrOldestMessageOfUser(ChatMessageResponse item, int index, int checkIndex, bool oldestOrNewestItem) {
    List<ChatMessageResponse>? list = pagingController.itemList;

    if (list == null) return true;

    //User's last (or first) message is the message which it's next (or previous) message belongs to other users or belongs to another day
    if (checkIndex >= 0 && checkIndex < list.length) {
      final checkItem = list[checkIndex];

      if (oldestOrNewestItem) {
        return true;
      } else {
        if (checkItem.sender == item.sender) {
          return false;
        } else {
          return true;
        }
      }

    } else {
      return true;
    }

  }

  void _onNewMessage(ChatMessageResponse message) {
    if (!_messageIsValid(message)) {
      return;
    }

    if (messageIsInWaiting(message)) {
      _checkToVerifyWaitingResponse(message);
    } else {
      _insertNewMessage(message);
    }
  }

  bool _messageIsValid(ChatMessageResponse? message) => message != null && message.roomId == roomInfo.id;

  Future<void> sendMessage(String message) async {

    DateTime sentTime = DateTime.now().toUtc();

    String localId = const Uuid().v4();

    //create a temporary response item to feedback to user
    //it will be verified after receiving message with the same localId from signalR
    var tempResponse = ChatMessageResponse(
      roomInfo.id,
      message,
      "text",
      roomInfo.users!.firstWhere((element) => element.userName == userName),
      sentTime,
      localId,
      roomInfo
    );

    tempResponse.state = MessageState.waiting;

    _waitingResponseLocalId.add(localId);
    _insertNewMessage(tempResponse);

    var request = CreateChatMessageRequest(roomInfo.id, message, localId);

    ChatMessageResponse? response;
    try {
      response = await _chatRepository.sendMessage(request);
    } catch (e) {
      //catch network error
      response = null;
    }

    //handle error response
    if (response == null) {
      _setMessageStateError2(tempResponse);
    }
  }

  Future<void> resendMessage(ChatMessageResponse message) async {
    _removeMessage(message);
    sendMessage(message.message);
  }

  bool messageIsInWaiting(ChatMessageResponse message) {
    return _waitingResponseLocalId.contains(message.localId);
  }

  void _checkToVerifyWaitingResponse(ChatMessageResponse message) {
    if (message.sender.userName != userName || !_messageIsValid(message)) {
      return;
    }

    if (_waitingResponseLocalId.contains(message.localId)) {
      debugPrint("remove waiting message");
      _verifyMessage(message);
    }
  }

  void _insertNewMessage(ChatMessageResponse message) {
    if (pagingController.itemList != null && pagingController.itemList!.isNotEmpty) {
      _checkLastOrFirstOfDay(message,  pagingController.itemList![0]);
    } else {
      message.isFirstOfDay = true;
      message.isLastOfDay = true;
    }

    pagingController.itemList?.insert(0, message);
    pagingController.notifyListeners();
  }
  
  bool _removeMessage(ChatMessageResponse message) {
    if (pagingController.itemList != null ) {
      var res = pagingController.itemList!.remove(message);
      pagingController.notifyListeners();
      return res;
    } else {
      return false;
    }
  }

  ///Verify current user sent message that has the same localId as [receiveMessage]
  void _verifyMessage(ChatMessageResponse receiveMessage) {
    var waitingMessage = pagingController.itemList?.firstWhere((element) => element.localId == receiveMessage.localId);
    if (waitingMessage != null) {
      waitingMessage.state = MessageState.verified;
      waitingMessage.createdAt = receiveMessage.createdAt;
      pagingController.notifyListeners();
    }
  }

  void _setMessageStateError(String localId) {
    _waitingResponseLocalId.remove(localId);
    var waitingMessage = pagingController.itemList?.firstWhere((element) => element.localId == localId);
    waitingMessage?.state = MessageState.error;
    notifyListeners();
  }

  void _setMessageStateError2(ChatMessageResponse response) {
    _waitingResponseLocalId.remove(response.localId);
    response.state = MessageState.error;
    notifyListeners();
  }

  @override
  void dispose() {
    _offSignalR();
    roomInfoNotifier.removeListener(_onRoomInfoChanged);
    super.dispose();
  }

  void _onRoomInfoChanged() {
    notifyListeners();
  }

  void _onSignalR() {
    _chatRepository.onNewMessage(_onNewMessage);
    _chatRepository.onUsersRemovedFromChatRoom(_onUsersRemovedFromChatRoom);
  }

  void _offSignalR() {
    _chatRepository.offSignalR();
  }


  //THIS SECTION IS FOR CHAT ROOM INFO PAGE---------------------------------------------------------------------------------

  final MultiSelectController<UserMinimizedInfo> multiSelectController = MultiSelectController();

  FetchState editNameState = FetchState.success;

  FetchState editUsersState = FetchState.success;

  void initMultiSelectController() {
    multiSelectController.refresh();
  }

  void editRoomName(String roomName) async {
    editNameState = FetchState.loading;
    notifyListeners();

    var result = await _chatRepository.editRoomName(ChatRoomEditRequest(roomInfo.id, roomName));

    if (result == null) {
      editNameState = FetchState.error;
      DialogUtils.showError(context, l10n.changeRoomNameFail);
    } else {
      editNameState = FetchState.success;
    }

    notifyListeners();
  }

  void addUsersToRoom(List<String> userNames) async {
    editUsersState = FetchState.loading;
    notifyListeners();

    final response = await _chatRepository.addUsersToChatRoom(roomInfo.id, RoomUsersEditRequest(userNames));

    if (response == null) {
      editUsersState = FetchState.error;
      DialogUtils.showError(context, l10n.addUsersToChatRoomFail);
    } else {
      editUsersState = FetchState.success;
    }

    notifyListeners();
  }

  void removeUsersFromRoom(List<String> userNames) async {
    editUsersState = FetchState.loading;
    notifyListeners();

    final response = await _chatRepository.removeUsersFromChatRoom(roomInfo.id, RoomUsersEditRequest(userNames));

    if (response == null) {
      editUsersState = FetchState.error;
      DialogUtils.showError(context, l10n.removeUsersFromChatRoomFail);
    } else {
      editUsersState = FetchState.success;
    }

    notifyListeners();
  }

  void _onUsersRemovedFromChatRoom(RoomUsersEditResponse response) {
    if (response.roomId != roomInfo.id) return;
    if (response.users.map((e) => e.userName).contains(userName)) {
      NavigatorExtension.backToHome(context);
      return;
    }
  }
}
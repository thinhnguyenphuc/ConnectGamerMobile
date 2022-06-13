import 'package:connectgamermobile/data/repositories/friend_repository.dart';
import 'package:connectgamermobile/models/commons/pagination.dart';
import 'package:connectgamermobile/models/commons/paging_response.dart';
import 'package:connectgamermobile/models/user/user_minimized_info.dart';
import 'package:connectgamermobile/view_models/common/int_scroll_pagination.dart';
import 'package:connectgamermobile/view_models/common/notification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';

import '../../models/friend/friend.dart';
import '../../models/friend/response/friend_request_response.dart';
import '../../models/friend/response/friend_request_response_minimize.dart';
import '../../resources/strings.dart';

class FriendHomeViewModel extends IntScrollPaginationViewModel<Friend> {

  String searchUserName = "";

  final FriendRepository _friendRepository = FriendRepository();

  BuildContext context;

  FriendHomeViewModel(this.context): super() {
    _onSignalR();
  }

  @override
  void dispose() {
    _friendRepository.offSignalR();
    super.dispose();
  }

  void _onSignalR() {
    _friendRepository.onFriendOnline(_onUserOnline);
    _friendRepository.onFriendOnline(_onUserOffline);
    _friendRepository.onFriendRequestAccept(_onFriendRequestAccepted);
    _friendRepository.onReceiveFriendRequest(_onReceiveFriendRequest);
  }

  @override
  Future<PagingResponse<Friend>?> fetchResponse(int pageKey) {
    return _friendRepository.getFriends(PaginationRequest(pageKey, itemPerPage), searchUserName);
  }

  void search(String userName) {
    if (searchUserName != userName) {
      searchUserName = userName;
      refresh();
    }
  }

  void _onUserOnline(List<Object>? objects) {
    _onUserStatus(objects, true);
  }

  void _onUserOffline(List<Object>? objects) {
    _onUserStatus(objects, false);
  }

  void _onUserStatus(List<Object>? objects, bool onlineStatus) {
    try {
      String userName = objects![0] as String;

      final friend = _tryFindFriend(userName);

      if (friend == null) return;

      friend.isOnline = onlineStatus;

      pagingController.notifyListeners();

    } catch(e,s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  Friend? _tryFindFriend(String userName) {
    return pagingController.itemList?.firstWhereOrNull((e) => e.userName == userName);
  }

  void _onReceiveFriendRequest(FriendRequestResponseMinimize response) {
    if (response.receiver.userName == Strings.testUsername) {
      NotificationController().onNewFriendRequest(context, response);
    }
  }

  void _onFriendRequestAccepted(FriendRequestResponseMinimize response) {
    if (response.requester.userName == Strings.testUsername) {
      _insertedNewFriendFrom(response.receiver, response.roomId!);
      NotificationController().onFriendRequestAccepted(context, response);
    } else {
      _insertedNewFriendFrom(response.requester, response.roomId!);
    }
  }

  void _insertedNewFriendFrom(UserMinimizedInfo info, String roomId) {
    pagingController.itemList?.insert(0, Friend(info.userName, info.avatar, info.displayName, null, roomId));
    pagingController.notifyListeners();
  }
  
}
import 'package:connectgamermobile/data/repositories/friend_repository.dart';
import 'package:connectgamermobile/models/commons/pagination.dart';
import 'package:connectgamermobile/models/commons/paging_response.dart';
import 'package:connectgamermobile/models/friend/friend.dart';
import 'package:flutter/cupertino.dart';

import '../common/int_scroll_pagination.dart';


class SelectFriendViewModel extends IntScrollPaginationViewModel<Friend> {
  GlobalKey<AnimatedListState> addedListKey = GlobalKey();

  List<String> excludedUserNames;
  List<Friend> addedUsers = [];

  String userName = "";

  SelectFriendViewModel([this.excludedUserNames = const []]): super();

  final FriendRepository _friendRepository = FriendRepository();

  bool removeFromAddedUsers(Friend user) {
    final result = addedUsers.remove(user);
    notifyListeners();
    return result;
  }
  
  bool insertedToAddedUsers(Friend user) {
    if (!userIsAdded(user)) {

      addedUsers.insert(0, user);

      addedListKey.currentState?.insertItem(0);
      notifyListeners();

      return true;
    } else {
      return false;
    }
  }

  bool userIsAdded(Friend user) {
    return addedUserNames.contains(user.userName);
  }

  List<String> get addedUserNames {
    return addedUsers.map((user) => user.userName)
        .toList(growable: false);
  }

  @override
  Future<PagingResponse<Friend>?> fetchResponse(int pageKey) async {
    return removeExcludedUsers(await _friendRepository.getFriends(PaginationRequest(pageKey, itemPerPage), userName));
  }

  PagingResponse<Friend>? removeExcludedUsers(PagingResponse<Friend>? response) {
    if (response == null) return response;

    response.data.retainWhere((element) => !excludedUserNames.contains(element.userName));
    return response;
  }

  void onSearch(String userName) {
    if (userName != this.userName) {
      this.userName = userName;
      refresh();
    }
  }
}
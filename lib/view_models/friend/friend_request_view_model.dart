import 'package:connectgamermobile/data/repositories/friend_repository.dart';
import 'package:connectgamermobile/models/commons/pagination.dart';
import 'package:connectgamermobile/models/commons/paging_response.dart';
import 'package:connectgamermobile/models/friend/response/friend_request_response.dart';
import 'package:connectgamermobile/models/friend/response/friend_request_response_minimize.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/view_models/common/int_scroll_pagination.dart';
import 'package:flutter/cupertino.dart';

class FriendRequestViewModel extends IntScrollPaginationViewModel<FriendRequestResponse> {
  final FriendRepository _friendRepository = FriendRepository();

  final List<String> _loadingIds = [];

  FriendRequestViewModel(): super() {
    _friendRepository.onReceiveFriendRequest(onReceiveFriendRequest);
  }
  @override
  void dispose() {
    _friendRepository.offSignalR();
    super.dispose();
  }

  @override
  Future<PagingResponse<FriendRequestResponse>?> fetchResponse(int pageKey) async {
    return await _friendRepository.getFriendRequests(PaginationRequest(pageKey, itemPerPage));
  }

  Future<bool> acceptFriendRequest(String id) async {
    return _actOnFriendRequest(id, true);
  }

  Future<bool> declineFriendRequest(String id) async {
    return _actOnFriendRequest(id, false);
  }

  Future<bool> _actOnFriendRequest(String id, bool accept) async {
    _startLoading(id);
    var result = accept? await _friendRepository.acceptFriendRequest(id): await _friendRepository.declineFriendRequest(id);
    _stopLoading(id);

    if (result) {
      removeItem(id);
    }

    return result;
  }

  void removeItem(String id) {
    pagingController.itemList?.removeWhere((element) => element.id == id);
    pagingController.notifyListeners();
  }

  void _startLoading(String id) {
    _loadingIds.add(id);
    notifyListeners();
  }

  void _stopLoading(String id) {
    _loadingIds.remove(id);
    notifyListeners();
  }

  bool isLoading(String id) {
    return _loadingIds.contains(id);
  }

  void onReceiveFriendRequest(FriendRequestResponseMinimize response) {
    if (response.receiver.userName == Strings.testUsername) {
      pagingController.itemList?.insert(0, FriendRequestResponse.pseudoFrom(response));
      pagingController.notifyListeners();
    }
  }
}
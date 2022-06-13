import 'dart:convert';

import 'package:connectgamermobile/data/network/api/friend_api.dart';
import 'package:connectgamermobile/data/repositories/commons/paging_repository_mixin.dart';
import 'package:connectgamermobile/models/commons/pagination.dart';
import 'package:connectgamermobile/models/commons/paging_response.dart';
import 'package:connectgamermobile/models/commons/signalr.dart';
import 'package:connectgamermobile/models/friend/response/friend_request_response_minimize.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/utils/int_utils.dart';
import 'package:flutter/cupertino.dart';

import '../../models/friend/friend.dart';
import '../../models/friend/response/friend_request_response.dart';
import 'commons/handle_signalr_mixin.dart';

class FriendRepository with HandlePagingResponseMixin, HandleSignalRMixin {
  Future<PagingResponse<Friend>?> getFriends(PaginationRequest paginationRequest, [String name = ""]) async {
    return handlePagingResponse(await FriendApi.getFriendList(paginationRequest, name), (jsonT) => Friend.fromJson(jsonT as Map<String, dynamic>));
  }
  
  Future<PagingResponse<FriendRequestResponse>?> getFriendRequests(PaginationRequest paginationRequest) async {
    return handlePagingResponse(await FriendApi.getFriendRequests(paginationRequest), (json) => FriendRequestResponse.fromJson(json as Map<String, dynamic>));
  }

  Future<bool> acceptFriendRequest(String id) async {
    try {
      return StatusCodeUtils.isSuccess((await FriendApi.acceptFriendRequest(id)).statusCode);
    } catch(e) {
      return false;
    }
  }

  Future<bool> declineFriendRequest(String id) async {
    try {
      return StatusCodeUtils.isSuccess((await FriendApi.declineFriendRequest(id)).statusCode);
    } catch(e) {
      return false;
    }
  }


  void onFriendOnline(void Function(List<Object>?) responseHandler) {
    onSignalR(SignalRRequest(SignalRMethodNames.userOnline, responseHandler));
  }

  void onFriendOffline(void Function(List<Object>?) responseHandler) {
    onSignalR(SignalRRequest(SignalRMethodNames.userOffline, responseHandler));
  }

  void onReceiveFriendRequest(void Function(FriendRequestResponseMinimize response) handler) {
    onSignalRJsonData(SignalRMethodNames.receiveFriendRequest, handler, (json) => FriendRequestResponseMinimize.fromJson(json));
  }

  void onFriendRequestAccept(void Function(FriendRequestResponseMinimize response) handler) {
    onSignalRJsonData(SignalRMethodNames.friendRequestAccepted, handler, (json) => FriendRequestResponseMinimize.fromJson(json));
  }
}
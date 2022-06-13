import 'package:connectgamermobile/models/friend/response/friend_request_response_minimize.dart';
import 'package:connectgamermobile/models/user/user_minimized_info.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part '../../generated/friend/response/friend_request_response.g.dart';

@JsonSerializable()
class FriendRequestResponse {
  String id;
  String requesterName;
  UserMinimizedInfo requester;
  String receiverName;
  UserMinimizedInfo receiver;
  DateTime createdAt;

  FriendRequestResponse(this.id, this.requesterName, this.requester,
      this.receiverName, this.receiver, this.createdAt);

  factory FriendRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FriendRequestResponseToJson(this);

  factory FriendRequestResponse.pseudoFrom(
          FriendRequestResponseMinimize response) =>
      FriendRequestResponse(
          response.id ?? const Uuid().v4(),
          response.requester.userName,
          response.requester,
          response.receiver.userName,
          response.receiver,
          DateTime.now());
}

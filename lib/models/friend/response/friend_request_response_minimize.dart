import 'package:connectgamermobile/models/user/user_minimized_info.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/friend/response/friend_request_response_minimize.g.dart';

@JsonSerializable()
class FriendRequestResponseMinimize {
  String? id;
  UserMinimizedInfo requester;
  UserMinimizedInfo receiver;
  String? roomId;

  FriendRequestResponseMinimize(
      this.id, this.requester, this.receiver, this.roomId);

  factory FriendRequestResponseMinimize.fromJson(Map<String, dynamic> json) => _$FriendRequestResponseMinimizeFromJson(json);
  Map<String, dynamic> toJson() => _$FriendRequestResponseMinimizeToJson(this);
}
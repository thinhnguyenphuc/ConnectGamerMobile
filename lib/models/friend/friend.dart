import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

import '../../resources/strings.dart';

part '../generated/friend/friend.g.dart';

@JsonSerializable()
class Friend {
  String userName;
  String? displayName;
  String? avatar;
  bool? isOnline;
  String? roomId;

  Friend(this.userName, this.displayName, this.avatar, this.isOnline, this.roomId);

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
  Map<String, dynamic> toJson() => _$FriendToJson(this);
}
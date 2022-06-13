import 'package:json_annotation/json_annotation.dart';

part '../../generated/friend/request/create_friend_request.g.dart';

@JsonSerializable()
class CreateFriendRequest {
  String friendUserName;

  CreateFriendRequest(this.friendUserName);
  
  factory CreateFriendRequest.fromJson(Map<String, dynamic> json) => _$CreateFriendRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateFriendRequestToJson(this);
}
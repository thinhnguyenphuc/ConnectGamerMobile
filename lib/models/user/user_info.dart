import 'package:json_annotation/json_annotation.dart';

part '../generated/user/user_info.g.dart';

@JsonSerializable()
class UserInfo {
  String userID;
  String userName;
  String email;
  String? avatar;
  String? bio;
  String? displayName;

  UserInfo(this.userID, this.userName, this.email, this.avatar, this.bio,
      this.displayName);

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
import 'dart:convert';

UserOverViewInfo userInfoFromJson(String str) => UserOverViewInfo.fromJson(json.decode(str));

String userInfoToJson(UserOverViewInfo data) => json.encode(data.toJson());

class UserOverViewInfo {
  UserOverViewInfo({
    required this.id,
    required this.userName,
    required this.email,
  });

  final String id;
  final String userName;
  final String email;

  factory UserOverViewInfo.fromJson(Map<String, dynamic> json) => UserOverViewInfo(
    id: json["id"],
    userName: json["userName"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "email": email,
  };
}
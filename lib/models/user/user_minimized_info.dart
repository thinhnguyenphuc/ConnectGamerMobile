import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';

part '../generated/user/user_minimized_info.g.dart';

@JsonSerializable()
class UserMinimizedInfo {
  String userName;
  String? avatar;
  String? displayName;

  UserMinimizedInfo(this.userName, this.avatar, this.displayName);

  factory UserMinimizedInfo.fromJson(Map<String, dynamic> json) => _$UserMinimizedInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserMinimizedInfoToJson(this);

  @override
  bool operator ==(Object other) {
    return other is UserMinimizedInfo && userName == other.userName;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => hash2(userName, userName);

}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../user/user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      json['userID'] as String,
      json['userName'] as String,
      json['email'] as String,
      json['avatar']!=null ? json['avatar'] as String : null,
      json['bio']!=null ? json['bio'] as String : null,
      json['displayName'] !=null ? json['displayName'] as String: null,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'userID': instance.userID,
      'userName': instance.userName,
      'email': instance.email,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'displayName': instance.displayName,
    };

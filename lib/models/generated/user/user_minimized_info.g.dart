// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../user/user_minimized_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMinimizedInfo _$UserMinimizedInfoFromJson(Map<String, dynamic> json) =>
    UserMinimizedInfo(
      json['userName'] as String,
      json['avatar'] as String?,
      json['displayName'] as String?,
    );

Map<String, dynamic> _$UserMinimizedInfoToJson(UserMinimizedInfo instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'avatar': instance.avatar,
      'displayName': instance.displayName,
    };

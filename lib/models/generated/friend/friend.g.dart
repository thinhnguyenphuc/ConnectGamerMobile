// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../friend/friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Friend _$FriendFromJson(Map<String, dynamic> json) => Friend(
      json['userName'] as String,
      json['displayName'] as String?,
      json['avatar'] as String?,
      json['isOnline'] as bool?,
      json['roomId'] as String?,
    );

Map<String, dynamic> _$FriendToJson(Friend instance) => <String, dynamic>{
      'userName': instance.userName,
      'displayName': instance.displayName,
      'avatar': instance.avatar,
      'isOnline': instance.isOnline,
      'roomId': instance.roomId,
    };

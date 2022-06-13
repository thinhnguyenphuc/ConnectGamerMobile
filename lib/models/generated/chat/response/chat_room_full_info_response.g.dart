// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../chat/response/chat_room_full_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomFullInfoResponse _$ChatRoomFullInfoResponseFromJson(
        Map<String, dynamic> json) =>
    ChatRoomFullInfoResponse(
      json['id'] as String,
      json['name'] as String,
      json['avatar'] as String?,
      (json['users'] as List<dynamic>?)
          ?.map((e) => UserMinimizedInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['type'] as int,
      (json['messages'] as List<dynamic>?)
          ?.map((e) => ChatMessageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['roomMasterName'] as String?,
    );

Map<String, dynamic> _$ChatRoomFullInfoResponseToJson(
        ChatRoomFullInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'users': instance.users,
      'type': instance.type,
      'messages': instance.messages,
      'roomMasterName': instance.roomMasterName,
    };

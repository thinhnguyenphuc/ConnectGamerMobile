// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../chat/response/chat_room_edit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomEditResponse _$ChatRoomEditResponseFromJson(
        Map<String, dynamic> json) =>
    ChatRoomEditResponse(
      json['roomId'] as String,
      json['name'] as String,
      ChatRoomSimplifyInfoResponse.fromJson(
          json['roomInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatRoomEditResponseToJson(
        ChatRoomEditResponse instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'name': instance.name,
      'roomInfo': instance.roomInfo,
    };

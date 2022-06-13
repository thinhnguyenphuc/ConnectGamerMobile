// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../chat/request/chat_room_edit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomEditRequest _$ChatRoomEditRequestFromJson(Map<String, dynamic> json) =>
    ChatRoomEditRequest(
      json['roomId'] as String,
      json['roomName'] as String,
    );

Map<String, dynamic> _$ChatRoomEditRequestToJson(
        ChatRoomEditRequest instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'roomName': instance.roomName,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../chat/response/room_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomMessageResponse _$RoomMessageResponseFromJson(Map<String, dynamic> json) =>
    RoomMessageResponse(
      json['roomId'] as String,
      (json['messages'] as List<dynamic>)
          .map((e) => ChatMessageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomMessageResponseToJson(
        RoomMessageResponse instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'messages': instance.messages,
    };

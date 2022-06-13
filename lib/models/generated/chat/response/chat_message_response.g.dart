// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../chat/response/chat_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageResponse _$ChatMessageResponseFromJson(Map<String, dynamic> json) =>
    ChatMessageResponse(
      json['roomId'] as String,
      json['message'] as String,
      json['messageType'] as String,
      UserMinimizedInfo.fromJson(json['sender'] as Map<String, dynamic>),
      DateTime.parse(json['createdAt'] as String),
      json['localId'] as String?,
      json['roomInfo'] == null
          ? null
          : ChatRoomFullInfoResponse.fromJson(
              json['roomInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatMessageResponseToJson(
        ChatMessageResponse instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'message': instance.message,
      'messageType': instance.messageType,
      'sender': instance.sender,
      'localId': instance.localId,
      'roomInfo': instance.roomInfo,
      'createdAt': instance.createdAt.toIso8601String(),
    };

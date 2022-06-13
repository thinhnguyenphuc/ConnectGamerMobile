// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../chat/request/create_chat_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChatMessageRequest _$CreateChatMessageRequestFromJson(
        Map<String, dynamic> json) =>
    CreateChatMessageRequest(
      json['roomId'] as String,
      json['message'] as String,
      json['localId'] as String,
    );

Map<String, dynamic> _$CreateChatMessageRequestToJson(
        CreateChatMessageRequest instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'message': instance.message,
      'localId': instance.localId,
    };

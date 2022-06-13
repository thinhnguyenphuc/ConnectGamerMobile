// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../chat/request/create_chat_room_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChatRoomRequest _$CreateChatRoomRequestFromJson(
        Map<String, dynamic> json) =>
    CreateChatRoomRequest(
      json['name'] as String?,
      (json['userNames'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CreateChatRoomRequestToJson(
        CreateChatRoomRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userNames': instance.userNames,
    };

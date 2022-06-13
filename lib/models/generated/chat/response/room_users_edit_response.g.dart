// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../chat/response/room_users_edit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomUsersEditResponse _$RoomUsersEditResponseFromJson(
        Map<String, dynamic> json) =>
    RoomUsersEditResponse(
      json['roomId'] as String,
      (json['users'] as List<dynamic>)
          .map((e) => UserMinimizedInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      ChatRoomFullInfoResponse.fromJson(
          json['roomInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoomUsersEditResponseToJson(
        RoomUsersEditResponse instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'users': instance.users,
      'roomInfo': instance.roomInfo,
    };

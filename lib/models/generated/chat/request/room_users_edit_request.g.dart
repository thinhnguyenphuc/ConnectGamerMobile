// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../chat/request/room_users_edit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomUsersEditRequest _$RoomUsersEditRequestFromJson(
        Map<String, dynamic> json) =>
    RoomUsersEditRequest(
      (json['userNames'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RoomUsersEditRequestToJson(
        RoomUsersEditRequest instance) =>
    <String, dynamic>{
      'userNames': instance.userNames,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../friend/response/friend_request_response_minimize.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendRequestResponseMinimize _$FriendRequestResponseMinimizeFromJson(
        Map<String, dynamic> json) =>
    FriendRequestResponseMinimize(
      json['id'] as String?,
      UserMinimizedInfo.fromJson(json['requester'] as Map<String, dynamic>),
      UserMinimizedInfo.fromJson(json['receiver'] as Map<String, dynamic>),
      json['roomId'] as String?,
    );

Map<String, dynamic> _$FriendRequestResponseMinimizeToJson(
        FriendRequestResponseMinimize instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requester': instance.requester,
      'receiver': instance.receiver,
      'roomId': instance.roomId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../friend/response/friend_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendRequestResponse _$FriendRequestResponseFromJson(
        Map<String, dynamic> json) =>
    FriendRequestResponse(
      json['id'] as String,
      json['requesterName'] as String,
      UserMinimizedInfo.fromJson(json['requester'] as Map<String, dynamic>),
      json['receiverName'] as String,
      UserMinimizedInfo.fromJson(json['receiver'] as Map<String, dynamic>),
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FriendRequestResponseToJson(
        FriendRequestResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requesterName': instance.requesterName,
      'requester': instance.requester,
      'receiverName': instance.receiverName,
      'receiver': instance.receiver,
      'createdAt': instance.createdAt.toIso8601String(),
    };

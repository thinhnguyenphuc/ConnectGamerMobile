// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../chat/request/chat_pagination_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatPaginationRequest _$ChatPaginationRequestFromJson(
        Map<String, dynamic> json) =>
    ChatPaginationRequest(
      DateTime.parse(json['date'] as String),
      json['itemPerPage'] as int,
    );

Map<String, dynamic> _$ChatPaginationRequestToJson(
        ChatPaginationRequest instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'itemPerPage': instance.itemPerPage,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../search/game_info/pubg_minimized_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PubgMinimizedInfo _$PubgMinimizedInfoFromJson(Map<String, dynamic> json) =>
    PubgMinimizedInfo(
      json['id'] as String,
      json['inGameName'] as String,
      json['avatar'] as String,
      json['level'] as String,
      json['rank'] as String?,
      json['platform'] as String,
    );

Map<String, dynamic> _$PubgMinimizedInfoToJson(PubgMinimizedInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inGameName': instance.inGameName,
      'avatar': instance.avatar,
      'level': instance.level,
      'rank': instance.rank,
      'platform': instance.platform,
    };

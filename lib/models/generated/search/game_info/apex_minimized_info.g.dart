// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../search/game_info/apex_minimized_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApexMinimizedInfo _$ApexMinimizedInfoFromJson(Map<String, dynamic> json) =>
    ApexMinimizedInfo(
      json['id'] as String,
      json['inGameName'] as String,
      json['avatar'] as String,
      json['level'] as String,
      json['rank'] as String?,
      json['rankDiv'] as String?,
      json['rankImg'] as String?,
      json['platform'] as String,
    );

Map<String, dynamic> _$ApexMinimizedInfoToJson(ApexMinimizedInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inGameName': instance.inGameName,
      'avatar': instance.avatar,
      'level': instance.level,
      'rank': instance.rank,
      'rankDiv': instance.rankDiv,
      'rankImg': instance.rankImg,
      'platform': instance.platform,
    };

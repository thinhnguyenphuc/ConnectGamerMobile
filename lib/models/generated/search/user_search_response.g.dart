// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../search/user_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSearchResponse<T> _$UserSearchResponseFromJson<T extends GameMinimizedInfo>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    UserSearchResponse<T>(
      UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      fromJsonT(json['gameInfo']),
    );

Map<String, dynamic> _$UserSearchResponseToJson<T extends GameMinimizedInfo>(
  UserSearchResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'userInfo': instance.userInfo,
      'gameInfo': toJsonT(instance.gameInfo),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../commons/paging_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagingResponse<T> _$PagingResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PagingResponse<T>(
      PaginationResponse.fromJson(json['pagination'] as Map<String, dynamic>),
      (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$PagingResponseToJson<T>(
  PagingResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'data': instance.data.map(toJsonT).toList(),
    };

import 'package:connectgamermobile/models/commons/pagination.dart';
import 'package:connectgamermobile/models/commons/response_mixin.dart';
import 'package:json_annotation/json_annotation.dart';

part '../generated/commons/paging_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PagingResponse<T> with BaseResponseMixin {
  PaginationResponse pagination;
  List<T> data;

  PagingResponse(this.pagination, this.data);

  factory PagingResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) => _$PagingResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) => _$PagingResponseToJson(this, toJsonT);
}
import 'package:json_annotation/json_annotation.dart';

part '../generated/commons/pagination.g.dart';

@JsonSerializable()
class PaginationRequest {
  int page;
  int itemPerPage;

  PaginationRequest(this.page, this.itemPerPage);

  Map<String, dynamic> toJson() => _$PaginationRequestToJson(this);

  Map<String, String> toQueryParams() => {
    "Page": page.toString(),
    "ItemPerPage": itemPerPage.toString(),
  };
}

@JsonSerializable()
class PaginationResponse {
  int currentPage;
  int totalPage;

  PaginationResponse(this.currentPage, this.totalPage);

  factory PaginationResponse.fromJson(Map<String, dynamic> json) => _$PaginationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationResponseToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

part '../../generated/chat/request/chat_pagination_request.g.dart';

@JsonSerializable()
class ChatPaginationRequest {
  DateTime date;
  int itemPerPage;

  ChatPaginationRequest(this.date, this.itemPerPage);

  Map<String, dynamic> toJson() => _$ChatPaginationRequestToJson(this);
}


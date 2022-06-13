import 'package:connectgamermobile/utils/int_utils.dart';
import 'package:json_annotation/json_annotation.dart';

mixin BaseResponseMixin {
  @JsonKey(ignore: true)
  String error = "";
  @JsonKey(ignore: true)
  int code = 0;

  bool success() {
    return StatusCodeUtils.isSuccess(code);
  }
}

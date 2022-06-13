import 'dart:convert';

import 'package:connectgamermobile/models/commons/paging_response.dart';
import 'package:connectgamermobile/utils/int_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

mixin HandlePagingResponseMixin {
  PagingResponse<T>? handlePagingResponse<T>(Response response, T Function(Object? json) fromJsonT) {
    try {
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      if (StatusCodeUtils.isSuccess(response.statusCode)) {
        return PagingResponse.fromJson(
            jsonDecode(response.body), fromJsonT)
          ..code = response.statusCode;
      } else {
        return null;
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return null;
    }
  }
}
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../../../utils/int_utils.dart';

mixin HandleResponseMixin {
  Future<T?> handleResponse<T>(Response response, T Function(Map<String, dynamic>) fromJson) async {
    try {
      if (StatusCodeUtils.isSuccess(response.statusCode)) {
        return fromJson(jsonDecode(response.body));
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
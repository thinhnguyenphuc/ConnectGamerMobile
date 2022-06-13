

import 'package:http/http.dart';

import '../../../../utils/api.dart';

class ApexApi {
  static Future<Response> getFullProfile(String inGameName) async {
    return ApiUtils.get(
      path: "api/apex/gameProfile/$inGameName",
    );
  }
}


import 'package:connectgamermobile/utils/api.dart';
import 'package:http/http.dart';

class LoginApi {
  static Future<Response> login(String email, String password) async {
    Map<String, String> auth = {};
    auth['email'] = email;
    auth['password'] = password;
    return ApiUtils.post(
      path: "api/Account/authenticate",
      body: auth,
    );
  }
}
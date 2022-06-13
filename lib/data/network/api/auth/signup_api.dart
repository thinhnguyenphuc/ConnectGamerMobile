import 'package:connectgamermobile/utils/api.dart';
import 'package:http/http.dart';

class SignUpApi {
  static Future<Response> signup(String email,String username, String password) async {
    Map<String, String> auth = {};
    auth['email'] = email;
    auth['username'] = username;
    auth['password'] = password;
    return ApiUtils.post(
      path: "api/Account/register",
      body: auth,
    );
  }
}
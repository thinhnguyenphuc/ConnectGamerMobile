import 'package:connectgamermobile/data/network/api/auth/signup_api.dart';
import 'package:http/http.dart';

class SignUpRepository {
  Future<Response> signup(String email, String username, String password) async {
    return await SignUpApi.signup(email, username, password);
  }
}
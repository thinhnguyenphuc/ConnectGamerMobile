import 'package:connectgamermobile/data/network/api/auth/login_api.dart';
import 'package:http/http.dart';

class LoginRepository {
  Future<Response> login(String email, String password) async {
    return await LoginApi.login(email, password);
  }
}
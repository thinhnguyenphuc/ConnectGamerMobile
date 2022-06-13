import 'package:connectgamermobile/data/repositories/auth/signup_repository.dart';
import 'package:connectgamermobile/view_models/common/base_view_model.dart';
import 'package:http/http.dart';

class SignUpViewModel extends BaseViewModel {
  Future<Response> signup(String email,String username, String password) async {
    return await SignUpRepository()
        .signup(email, username, password);
  }
}

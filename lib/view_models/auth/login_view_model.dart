
import 'dart:convert';

import 'package:connectgamermobile/data/repositories/auth/login_repository.dart';
import 'package:connectgamermobile/data/repositories/user_repository.dart';
import 'package:connectgamermobile/data/user_info.dart';
import 'package:connectgamermobile/view_models/common/base_view_model.dart';
import 'package:http/http.dart';

class LoginViewModel extends BaseViewModel {
  Future<Response> login(String email, String password) async {
    Response res = await LoginRepository().login(email, password);
    if(res.statusCode == 200){
      Authorization().initialize(jsonDecode(res.body)["token"]);
      UserRepository().fetchUserOverallInfo();
    }
    return res;
  }
}

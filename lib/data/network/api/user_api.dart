import 'package:connectgamermobile/data/user_info.dart';
import 'package:connectgamermobile/utils/api.dart';
import 'package:http/http.dart';

class UserApi {
  static Future<Response> fetchUserOverallInfo() async {
    return ApiUtils.get(
      path: "api/Account/get-info",
      token: Authorization().getToken(),
    );
  }
  static Future<Response> fetchUserDetailInfo(String username) async {
    return ApiUtils.get(
      path: "api/User/profile/$username",
    );
  }
}
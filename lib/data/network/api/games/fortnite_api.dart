import 'package:connectgamermobile/utils/api.dart';
import 'package:http/http.dart';

class FortniteApi {
  static Future<Response> getFullProfile(String inGameName) async {
    return ApiUtils.get(
      path: "api/fortnite/gameProfile/$inGameName",
    );
  }
}
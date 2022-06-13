import 'package:http/http.dart';
import '../../../../utils/api.dart';

class PUBGApi {
  static Future<Response> getFullProfile(String inGameName) async {
    return ApiUtils.get(
      path: "api/game/pubg/gameProfile/$inGameName",
    );
  }
}
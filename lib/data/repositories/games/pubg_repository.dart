import 'dart:convert';

import 'package:connectgamermobile/data/network/api/games/pubg_api.dart';
import 'package:connectgamermobile/models/game/pubg/pubg_profile.dart';


class PUBGRepository {
  Future<PUBGProfile> getFullProfile(String inGameName) async {
    var response = await PUBGApi.getFullProfile(inGameName);

    return PUBGProfile.fromJson(jsonDecode(response.body));
  }
}
import 'dart:convert';

import 'package:connectgamermobile/data/network/api/games/fortnite_api.dart';
import 'package:connectgamermobile/models/game/fortnite/fortnite_model.dart';

class FortniteRepository {
  Future<FortniteProfile> getFullProfile(String inGameName) async {
    var response = await FortniteApi.getFullProfile(inGameName);

    return FortniteProfile.fromJson(jsonDecode(response.body));
  }
}
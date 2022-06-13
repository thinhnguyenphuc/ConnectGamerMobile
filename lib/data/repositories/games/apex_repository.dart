import 'dart:convert';

import 'package:connectgamermobile/data/network/api/games/apex_api.dart';

import '../../../models/game/apex/apex_profile.dart';

class ApexRepository {
  Future<ApexProfile> getFullProfile(String inGameName) async {
    var response = await ApexApi.getFullProfile(inGameName);

    return ApexProfile.fromJson(jsonDecode(response.body));
  }
}

import 'package:connectgamermobile/models/search/game_info/apex_minimized_info.dart';
import 'package:connectgamermobile/models/search/game_info/pubg_minimized_info.dart';
import 'package:connectgamermobile/resources/enums.dart';
import 'package:flutter/cupertino.dart';

abstract class GameMinimizedInfo {
  Widget buildWidget(BuildContext context);

  static GameMinimizedInfo fromJson(Object? json, SupportedGame game) {
    var convertedJson = json as Map<String, dynamic>;
    switch (game) {
      case SupportedGame.apex:
        return ApexMinimizedInfo.fromJson(convertedJson);
      case SupportedGame.pubg:
        return PubgMinimizedInfo.fromJson(convertedJson);
    }
  }
}
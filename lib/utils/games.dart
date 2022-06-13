import 'package:connectgamermobile/models/game/pubg/duo_model.dart';
import 'package:connectgamermobile/resources/enums.dart';

class GameUtils {
  static const String WINS = "wins";
  static const String LOSES = "loses";
  static const String WINRATE = "winRate";
  static const String TOP10RATE = "top10Rate";
  static const String KILLS = "kills";
  static const String HEADSHOTKILL = "headshotKills";
  static const String HEADSHOTRATE = "headshotRate";
  static const String LONGESTKILL = "longestKill";
  static const String TOP10S = "top10s";

  static String getDisplayNameOf(SupportedGame game) {
    switch (game) {
      case SupportedGame.apex:
        return "Apex Legends";
      case SupportedGame.pubg:
        // TODO: Handle this case.
        return "PlayerUnknown's Battlegrounds";
    }
  }

  static String getIconPathOf(SupportedGame game) {
    const iconDir = "assets/game_icons/";

    switch (game) {
      case SupportedGame.apex:
        return iconDir + "apex.png";
      case SupportedGame.pubg:
        return iconDir + "PUBG PC.png";
    }
  }

  static String getSumOfDuoAttribute(String attributeName, List<Duo> list) {
    switch (attributeName) {
      case WINS:
        return list
            .fold<int>(0, (sum, element) => sum + element.wins)
            .toString();
      case LOSES:
        return list
            .fold<int>(0, (sum, element) => sum + element.loses)
            .toString();
      case WINRATE:
        return "${(list.fold<double>(0, (sum, element) => sum + element.winRate) / list.length * 100).toStringAsFixed(2)}%";
      case TOP10RATE:
        return "${(list.fold<double>(0, (sum, element) => sum + element.top10Rate) / list.length * 100).toStringAsFixed(2)}%";
      case KILLS:
        return list
            .fold<int>(0, (sum, element) => sum + element.kills)
            .toString();
      case HEADSHOTKILL:
        return list
            .fold<int>(0, (sum, element) => sum + element.headshotKills)
            .toString();
      case HEADSHOTRATE:
        return "${(list.fold<double>(0, (sum, element) => sum + element.headshotRate) / list.length * 100).toStringAsFixed(2)}%";
      case LONGESTKILL:
        double max = 0;
        for (Duo dou in list) {
          if (dou.longestKill > max) {
            max = dou.longestKill;
          }
        }
        return max.toString();
      case TOP10S:
        return list
            .fold<int>(0, (sum, element) => sum + element.top10S)
            .toString();
    }
    return "";
  }

  static String getDuoAttribute(String attributeName, Duo duo) {
    switch (attributeName) {
      case WINS:
        return duo.wins.toString();
      case LOSES:
        return duo.loses.toString();
      case WINRATE:
        return "${(duo.winRate * 100).toStringAsFixed(2)}%";
      case TOP10RATE:
        return "${(duo.top10Rate * 100).toStringAsFixed(2)}%";
      case KILLS:
        return duo.kills.toString();
      case HEADSHOTKILL:
        return duo.headshotKills.toString();
      case HEADSHOTRATE:
        return "${(duo.headshotRate * 100).toStringAsFixed(2)}%";
      case LONGESTKILL:
        return duo.longestKill.toString();
      case TOP10S:
        duo.top10Rate.toString();
    }
    return "";
  }
}

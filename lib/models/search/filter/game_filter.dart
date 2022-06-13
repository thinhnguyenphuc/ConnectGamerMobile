
import 'package:connectgamermobile/resources/enums.dart';

abstract class GameFilter {
  Map<String, dynamic> toJson();
}

class GameFilterFactory {
  static GameFilter createDefaultFrom(SupportedGame game) {
    switch (game) {
      case SupportedGame.apex:
        return ApexGameFilter.create();
      case SupportedGame.pubg:
        return ApexGameFilter.create();
    }
  }
}

class ApexGameFilter extends GameFilter {
  late List<String> ranks;

  ApexGameFilter(this.ranks);

  factory ApexGameFilter.create({List<String>? ranks}) {
    return ApexGameFilter(ranks ?? []);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "ranks": ranks,
    };
  }
}

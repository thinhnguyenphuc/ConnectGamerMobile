import 'package:connectgamermobile/custom_classes/extensions/navigator_extension.dart';
import 'package:flutter/cupertino.dart';

class AccountGameListViewModel {
  static const int FORTNITE_ORDER = 0;
  static const int PUBG_ORDER = 1;
  static const int APEX_ORDER = 2;

  static void navigateToGamePage(BuildContext context, int order) {
    switch (order) {
      case FORTNITE_ORDER:
        {
          NavigatorExtension.toFortniteDetailPage(context);
          break;
        }
      case PUBG_ORDER:
        {
          NavigatorExtension.toPUBGDetailPage(context);
          break;
        }
      case APEX_ORDER:
        {
          NavigatorExtension.toApexDetailPage(context);
          break;
        }
    }
  }
}

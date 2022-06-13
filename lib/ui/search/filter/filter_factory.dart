import 'package:connectgamermobile/resources/enums.dart';
import 'package:connectgamermobile/ui/search/filter/apex_filter_dialog.dart';
import 'package:flutter/cupertino.dart';

class FilterDialogFactory {
  FilterDialogFactory._();

  static Widget buildFilterDialog(SupportedGame game) {
    switch (game) {
      case SupportedGame.apex:
        return ApexFilterDialog();
      case SupportedGame.pubg:
        return ApexFilterDialog();
    }
  }
}
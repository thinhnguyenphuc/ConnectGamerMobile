import 'package:connectgamermobile/utils/screen.dart';
import 'package:flutter/cupertino.dart';

class Insets {

  late double extraSmall;
  late double small;
  late double normal;
  late double large;
  late double extraLarge;

  Insets.of(BuildContext context) {
    if (ScreenSizeUtils.getSize(context).index >= ScreenSize.large.index) {
      //Large, Extra Large
      extraSmall = 2;
      small = 6;
      normal = 8;
      large = 12;
      extraLarge = 24;

    } else {
      //Small, normal
      extraSmall = 1;
      small = 4;
      normal = 5;
      large = 10;
      extraLarge = 20;
    }

  }
}

class Durations {
  static const double toastLong = 3500;
  static const double toastShort = 2000;
}
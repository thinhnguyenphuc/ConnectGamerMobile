import 'package:connectgamermobile/resources/themes.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:flutter/material.dart';

class ColorUtils {

  ///https://stackoverflow.com/a/58604669
  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  ///https://stackoverflow.com/a/58604669
  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

}

class GradientUtils {
  static Widget paintWidget(BuildContext context, Widget? widget, [Gradient? gradient]) {
    return GradientContainer(
      child: widget,
      gradient: gradient ?? Themes.getGradientFrom(Theme.of(context)),
    );
  }

  static List<Widget>? paintWidgetList(BuildContext context, List<Widget>? widgets, [Gradient? gradient]) {
    if (widgets == null) {
      return widgets;
    } else {
      return widgets.map((widget) {
        return paintWidget(context, widget, gradient);
      }).toList();
    }
  }
}
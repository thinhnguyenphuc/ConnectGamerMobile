import 'package:connectgamermobile/resources/themes.dart';
import 'package:flutter/material.dart';

///Child will be paint with gradient;
class GradientContainer extends StatelessWidget {

  final Widget? child;
  final Gradient gradient;

  const GradientContainer({Key? key,
    required this.child,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}

class ThemeBaseGradientContainer extends StatelessWidget {
  final Widget? child;

  const ThemeBaseGradientContainer({Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: child,
      gradient: Themes.getGradientFrom(Theme.of(context)),
    );
  }
}
import 'package:connectgamermobile/resources/themes.dart';
import 'package:connectgamermobile/utils/color.dart';
import 'package:flutter/material.dart';

class GradientBorderIconButton extends StatelessWidget {

  final Color backgroundColor;
  final Gradient? gradient;
  final double radius;
  final double borderWith;

  final void Function()? onPressed;
  final Widget icon;
  final bool paintIconWithGradient;

  ///Please make sure [backgroundColor] != [Colors.transparent] and == your background color
  const GradientBorderIconButton({Key? key,
    required this.backgroundColor,
    this.gradient,
    this.radius = 21,
    this.borderWith = 1,
    required this.icon,
    this.onPressed,
    this.paintIconWithGradient = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final gradient = this.gradient ?? Themes.getGradientFrom(Theme.of(context));

    //Create an extra ink in case of appbar's back button
    return Ink(
      child: Align(
        alignment: Alignment.center,
        child: Ink(
          width: (radius + borderWith) * 2,
          height: (radius + borderWith) * 2,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: gradient
          ),
          child: Align(
            alignment: Alignment.center,
            child: Ink(
              width: radius * 2,
              height: radius * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
              ),
              child: Align(
                alignment: Alignment.center,
                child: IconButton(
                    splashRadius: radius,
                    onPressed: onPressed,
                    icon: paintIconWithGradient? GradientUtils.paintWidget(context, icon): icon
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}
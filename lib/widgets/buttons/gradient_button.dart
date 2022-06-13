import 'package:connectgamermobile/resources/themes.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {

  final void Function()? onPressed;
  final BorderRadius borderRadius;
  final Gradient? gradient;
  final BoxConstraints? constraints;
  final Widget? child;

  const GradientButton({Key? key,
    this.onPressed,
    this.borderRadius = BorderRadius.zero,
    this.gradient,
    this.constraints,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
     onPressed: onPressed,
     style: ElevatedButton.styleFrom(
       shape: RoundedRectangleBorder(borderRadius: borderRadius),
       padding: EdgeInsets.zero
     ),
     child: Ink(
       decoration: BoxDecoration(
         gradient: gradient ?? Themes.getGradientFrom(Theme.of(context)),
         borderRadius: borderRadius,
       ),
       child: Container(
         constraints: constraints ?? const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
         alignment: Alignment.center,
         child: child,
       ),
     ),
   );
  }
}
import 'package:flutter/material.dart';

import '../../resources/strings.dart';
import '../../widgets/containers/gradient_container.dart';

class ErrorImage extends StatelessWidget {
  final Widget icon;
  final double centerCircleSize;

  const ErrorImage({Key? key,
    required this.icon,
    this.centerCircleSize = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double logoSize = centerCircleSize * 2.8;
    return SizedBox(
      height: logoSize,
      width: logoSize,
      child: Stack(
        children: [
          ThemeBaseGradientContainer(
            child: Image.asset(
              AssetPaths.errorLogo,
              fit: BoxFit.cover,
              height: logoSize,
              width: logoSize,
            ),
          ),
          Center(
            child: Container(
              height: centerCircleSize,
              width: centerCircleSize,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              alignment: Alignment.center,
              child: icon,
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {

  final String imagePath;
  final double imageWidth;
  final double imageHeight;
  final void Function()? onClickedCallback;
  final BoxFit imageFit;

  const CircleImage({Key? key,
    required this.imagePath,
    this.imageWidth = 24,
    this.imageHeight = 24,
    this.onClickedCallback,
    this.imageFit = BoxFit.fill,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular((imageWidth > imageHeight) ? imageWidth: imageHeight);

    return  InkWell(
      onTap: onClickedCallback,
      splashFactory: InkRipple.splashFactory,
      borderRadius: borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset(
          imagePath,
          height: imageHeight,
          width: imageWidth,
          fit: imageFit,
        ),
      ),
    );
  }

}
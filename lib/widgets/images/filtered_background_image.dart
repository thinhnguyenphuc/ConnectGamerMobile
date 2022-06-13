import 'package:flutter/material.dart';

class FilteredBackgroundImage extends StatelessWidget {
  final double width;
  final double height;

  final ImageProvider image;

  final ColorFilter? colorFilter;

  const FilteredBackgroundImage({Key? key,
    this.width = 24,
    this.height = 24,
    required this.image,
    this.colorFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: colorFilter ?? ColorFilter.mode(
        Colors.black.withOpacity(0.5),
        BlendMode.dstATop,
      ),
      child: Image(
        image: image,
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }

}
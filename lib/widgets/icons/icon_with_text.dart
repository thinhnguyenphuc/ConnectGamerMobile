import 'package:flutter/material.dart';

class IconWithText extends StatefulWidget {
  final Icon icon;

  final double? iconSplashRadius;
  ///Ex: AxisDirection.right will make the text appears to the right of icon
  final AxisDirection textToIconDirection;

  final int distanceBetweenTextAndIcon;

  const IconWithText({Key? key,
    required this.icon,
    this.textToIconDirection = AxisDirection.right,
    this.distanceBetweenTextAndIcon = 0,
    this.iconSplashRadius,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IconWithTextState();

}

class _IconWithTextState extends State<IconWithText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        direction: convertToAxis(widget.textToIconDirection),
        children: createMainLayout(),
      ),
    );
  }

  Axis convertToAxis(AxisDirection direction) {
    return (direction == AxisDirection.left || direction == AxisDirection.right) ? Axis.horizontal: Axis.vertical;
  }

  //Create main layout with order bases on [textToIconDirection]
  List<Widget> createMainLayout() {
    var icon = IconButton(
      splashRadius: widget.iconSplashRadius,
      onPressed: () {},
      icon: widget.icon,
    );

    var padding = SizedBox(
      width: widget.distanceBetweenTextAndIcon.toDouble(),
      height: widget.distanceBetweenTextAndIcon.toDouble(),
    );

    var text = const Text("123");

    if (widget.textToIconDirection == AxisDirection.right || widget.textToIconDirection == AxisDirection.down) {
      return [icon, padding, text];
    } else {
      return [text, padding, icon];
    }
  }
}
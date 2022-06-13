import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopSnackBarContainer extends StatelessWidget with StatelessVariablesMixin{
  Widget child;

  TopSnackBarContainer({Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.symmetric(vertical: insets.large, horizontal: insets.large),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border.all(color: theme.backgroundColor),
        borderRadius: BorderRadius.circular(insets.large),
        boxShadow: const [BoxShadow(
          color: Colors.black26,
          offset: Offset(0.0, 8.0),
          spreadRadius: 1,
          blurRadius: 30,
        )],
      ),
      child: child,
    );
  }

}
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget with StatelessVariablesMixin {

  final String text;
  final EdgeInsets? padding;

  TextDivider({Key? key,
    required this.text,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: insets.large),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Divider(
              endIndent: insets.large,
              indent: insets.large,
              color: Colors.grey.shade400,
              thickness: 1,
            ),
          ),
          Text(text,
            style: Theme.of(context).textTheme.headline6,
          ),
          Expanded(
            flex: 1,
            child: Divider(
              endIndent: insets.large,
              indent: insets.large,
              color: Colors.grey.shade400,
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }

}
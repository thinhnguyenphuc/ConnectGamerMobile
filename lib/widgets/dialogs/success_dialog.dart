import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/widgets/buttons/gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../containers/gradient_container.dart';

class SuccessDialog extends StatelessWidget with StatelessVariablesMixin{

  final Widget? content;
  final String text;

  SuccessDialog({Key? key,
    this.content,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return AlertDialog(
      content: content ?? Text(
        text,
        maxLines: 5,
        style: theme.textTheme.bodyText2,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.check, color: Colors.green,)),
      ],
    );
  }
}
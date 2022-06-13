import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/widgets/buttons/gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../containers/gradient_container.dart';

class ErrorDialog extends StatelessWidget with StatelessVariablesMixin{

  final String text;

  ErrorDialog({Key? key,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return AlertDialog(
      title: ThemeBaseGradientContainer(
        child: Text(l10n.errorDialogTitle),
      ),
      content: Text(
        text,
        maxLines: 5,
        style: theme.textTheme.bodyText2,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        GradientButton(
          constraints: BoxConstraints(
            maxWidth: 64,
            maxHeight: 36
          ),
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(l10n.okBtnTitle),
        ),
      ],
    );
  }
}
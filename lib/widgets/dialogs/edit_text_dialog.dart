import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../buttons/gradient_button.dart';
import '../containers/gradient_container.dart';

class EditTextDialog extends StatelessWidget with StatelessVariablesMixin {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String title;
  final String? hintText;

  final GlobalKey<FormState> _formKey = GlobalKey();

  EditTextDialog({Key? key,
    this.validator,
    this.controller,
    this.title = "",
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SimpleDialog(
      titlePadding: EdgeInsets.only(top: insets.large, left: insets.extraLarge, right: insets.extraLarge),
      title: ThemeBaseGradientContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            IconButton(
              splashRadius: 24,
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context, false),
            )
          ],
        ),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: insets.large, horizontal: insets.extraLarge),
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
            ),
            controller: controller,
            validator: validator,
          ),
        ),
        SizedBox(
          height: insets.large,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientButton(
                child: Text(l10n.okBtnTitle),
                onPressed: () => {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, true),
                  }
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:flutter/material.dart';

class TextFieldGradientAppBar with WidgetBuilderVariableMixin {
  final TextEditingController? textEditingController;
  final GradientAppBarData data;
  final String? hintText;
  final bool enabled;

  ///Remember to call [build]
  TextFieldGradientAppBar({
    this.textEditingController,
    this.hintText,
    this.enabled = true,
    required this.data,
  });

  PreferredSizeWidget build(BuildContext context) {
    initVariables(context);

    data.title = TextField(
      autofocus: false,
      controller: textEditingController,
      enabled: enabled,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: theme.textTheme.bodyText2?.fontWeight,
          fontSize: theme.textTheme.bodyText2?.fontSize,
          color: theme.hintColor,
        )
      ),
    );
    return GradientAppBar(data: data,
      titleIsGradient: false,
    ).build(context);
  }

}

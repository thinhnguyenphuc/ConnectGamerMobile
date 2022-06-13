import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleSettingTile extends StatelessWidget with StatelessVariablesMixin {
  final EdgeInsets padding;
  final String title;
  final Widget? endIcon;
  final Widget? leadingIcon;
  final void Function()? onTap;

  SimpleSettingTile({Key? key,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    this.title = "",
    this.endIcon,
    this.leadingIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkWell(
      onTap: onTap,
      splashFactory: InkRipple.splashFactory,
      child: Padding(
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leadingIcon != null) ...[
                  leadingIcon!,
                  SizedBox(width: insets.large,)
                ],
                Text(
                  title,
                  style: theme.textTheme.bodyText2,
                )
              ],
            ),
            endIcon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

}
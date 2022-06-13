import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/nums.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/ui/commons/error_image.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmptyMessageIndicator extends StatelessWidget with StatelessVariablesMixin {
  EmptyMessageIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ErrorImage(
              icon:  SizedBox(
                height: 24,
                width: 24,
                child:  ThemeBaseGradientContainer(
                  child: Image.asset(
                    AssetPaths.noMessageIcon,
                    height: 24,
                    fit: BoxFit.contain,
                    width: 24,
                  ),
                ),
              ),
            ),
            SizedBox(height: insets.extraLarge,),
            Text(
              l10n.noMessages,
              style: theme.textTheme.bodyText2,
            )
          ],
        ),
      ),
    );
  }
}
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/ui/commons/error_image.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttons/gradient_button.dart';

class FetchEmptyWidget extends StatelessWidget with StatelessVariablesMixin{
  FetchEmptyWidget({Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ErrorImage(
              icon: ThemeBaseGradientContainer(
                child: Icon(
                  Icons.no_accounts,
                  size: 36,
                ),
              ),
              centerCircleSize: 48,
            ),
            SizedBox(height: insets.extraLarge,),
            Text(l10n.noDataMessage, style: theme.textTheme.headline5,),
          ],
        ),
      ),
    );
  }

}
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttons/gradient_button.dart';
import 'error_image.dart';

class FetchErrorWidget extends StatelessWidget with StatelessVariablesMixin{
  String error;
  Function()? onRetry;
  
  FetchErrorWidget({Key? key,
    this.error = "",
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: insets.extraLarge),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ErrorImage(
                icon: Icon(
                  Icons.error,
                  size: 36,
                  color: theme.errorColor,
                ),
                centerCircleSize: 48,
              ),
              if (error.isNotEmpty) Padding(
                child: Text(error, style: theme.textTheme.headline5,),
                padding: EdgeInsets.all(insets.large),
              ),
              GradientButton(
                constraints: const BoxConstraints(
                    maxWidth: 120,
                    maxHeight: 48
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.refresh, color: theme.textTheme.bodyText1?.color,),
                    SizedBox(width: insets.normal,),
                    Text(l10n.retry, style: theme.textTheme.bodyText1,
                    )
                  ],
                ),
                borderRadius: BorderRadius.circular(insets.small),
                onPressed: onRetry,
              )
            ],
          ),
        ),
      ),
    );
  }
}
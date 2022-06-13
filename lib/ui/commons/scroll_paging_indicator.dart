import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/nums.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

double height = 90;

class NewPageLoadingIndicator extends StatelessWidget {
  const NewPageLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      padding: EdgeInsets.all(Insets.of(context).large),
      alignment: Alignment.center,
      child: const ThemeBaseGradientContainer(
        child: LoadingIndicator(
          indicatorType: Indicator.ballScale,
        ),
      ),
    );
  }
}

class NewPageErrorIndicator extends StatelessWidget
    with StatelessVariablesMixin {
  final Function()? onRetry;
  final String error;

  NewPageErrorIndicator({
    Key? key,
    this.onRetry,
    this.error = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Ink(
      height: height,
      width: height,
      padding: EdgeInsets.all(Insets.of(context).large),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(error.isEmpty ? l10n.scrollPagingErrorDefaultMessage : error),
          IconButton(
            icon: const ThemeBaseGradientContainer(
              child: Icon(Icons.refresh),
            ),
            splashRadius: 24,
            iconSize: 24,
            padding: EdgeInsets.zero,
            onPressed: onRetry,
          )
        ],
      ),
    );
  }
}

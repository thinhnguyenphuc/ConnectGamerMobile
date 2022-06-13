import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../widgets/containers/gradient_container.dart';

class LoadingRowWidget extends StatelessWidget with StatelessVariablesMixin {
  final bool show;
  final String text;

  LoadingRowWidget({Key? key,
    required this.show,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: show? 64: 0,
      child: Center(
        child: AnimatedOpacity(
          opacity: show? 1: 0,
          duration: const Duration(milliseconds: 500),
          child: ThemeBaseGradientContainer(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 24,
                  width: 24,
                  child: LoadingIndicator(
                    indicatorType: Indicator.circleStrokeSpin,
                  ),
                ),
                SizedBox(width: insets.large,),
                Text(
                  text,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
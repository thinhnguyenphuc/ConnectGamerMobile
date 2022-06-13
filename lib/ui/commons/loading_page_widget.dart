import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class FetchingWidget extends StatelessWidget {
  const FetchingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height/4,
        width: MediaQuery.of(context).size.height/4,
        child: const ThemeBaseGradientContainer(
          child: LoadingIndicator(
            indicatorType: Indicator.ballScale,
          ),
        ),
      ),
    );
  }
  
}
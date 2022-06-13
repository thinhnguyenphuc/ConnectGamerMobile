import 'package:connectgamermobile/ui/app.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart' as tsb;

class SnackBarUtils {
  static void showSnackBarMessage(String message,
      {BuildContext? context, bool error = false}) {

    final text = Text(
      message,
      style: TextStyle(
        color: error ? Colors.red : Colors.green,
        fontWeight: FontWeight.bold,
      ),
    );
    App.messengerKey.currentState?.showSnackBar(SnackBar(
      content: error
          ? text
          : ThemeBaseGradientContainer(
              child: text,
            ),
    ));
  }
}
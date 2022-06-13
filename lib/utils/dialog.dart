import 'package:connectgamermobile/widgets/dialogs/success_dialog.dart';
import 'package:flutter/material.dart';

import '../widgets/dialogs/error_dialog.dart';

class DialogUtils {
  static void showError(BuildContext context, String text) {
    showDialog(context: context, builder: (context) {
      return ErrorDialog(
        text: text
      );
    });
  }

  static void showSuccess(BuildContext context, {String text = "", Widget? content}) {
    showDialog(context: context, builder: (context) {
      return SuccessDialog(
        text: text,
        content: content,
      );
    });
  }

  static void showIndicatorDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
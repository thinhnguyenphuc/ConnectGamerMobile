import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/nums.dart';

class AlertUtils {
  AlertUtils._();

  static void showErrorToast(BuildContext context, String error, {
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration? duration,
  }) {
    var fToast = FToast();
    fToast.init(context);

    final theme = Theme.of(context);
    final insets = Insets.of(context);

    Widget toast = Container(
      padding: EdgeInsets.symmetric(horizontal: insets.extraLarge, vertical: insets.large),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error,
            color: theme.errorColor,
          ),
          SizedBox(
            width: insets.large
          ),
          Text(error,
            style: TextStyle(
              color: theme.errorColor
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: gravity,
      toastDuration: duration,
    );
  }
}
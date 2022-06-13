import 'package:flutter/cupertino.dart';

///A wrapper for widget contains one or more text fields
///
/// When wrapping a widget with this wrapper,
/// clicking on other places other than the text field which currently is being focusing will unfocus it
class TextFieldUnfocusedWrapper extends StatelessWidget {

  Widget child;

  TextFieldUnfocusedWrapper({Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: child,
    );
  }

}
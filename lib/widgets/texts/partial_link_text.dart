import 'package:flutter/material.dart';

class PartialLinkText extends StatelessWidget {

  final String normalText;
  final String linkText;
  final double fontSize;
  final Color textColor;
  final void Function()? onLinkClickedCallback;

  ///Create a normal text continues with a link text
  ///
  const PartialLinkText({Key? key,
    this.normalText = "",
    this.linkText = "",
    this.fontSize = 18,
    this.textColor = Colors.blue,
    this.onLinkClickedCallback,
  }):
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child:
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(normalText,
                style: TextStyle(fontSize: fontSize),
              ),
              TextButton(
                  onPressed: onLinkClickedCallback,
                  child: Text(linkText,
                      style: TextStyle(
                          fontSize: fontSize,
                          decoration: TextDecoration.underline,
                          color: textColor,
                      )
                  ))
            ])
    );
  }
}

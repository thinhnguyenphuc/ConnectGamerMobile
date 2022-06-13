import 'package:flutter/material.dart';

class TextWidgetUtils {

  static Size textSizeOf(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  ///source: https://stackoverflow.com/a/65408733
  static bool hasTextOverflow(
      String text,
      TextStyle style,
      {double minWidth = 0,
        double maxWidth = double.infinity,
        int maxLines = 1
      }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }
}
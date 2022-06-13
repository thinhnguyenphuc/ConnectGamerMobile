import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeStamp extends StatelessWidget {

  final DateTime dateTime;
  late DateFormat? dateFormat;

  final EdgeInsets margin;

  final Alignment alignment;

  final TextStyle? textStyle;

  TimeStamp({Key? key,
    required this.dateTime,
    this.margin = EdgeInsets.zero,
    this.alignment = Alignment.center,
    this.dateFormat,
    this.textStyle,
  }) : super(key: key) {
    dateFormat ??= DateFormat.yMMMMd(Platform.localeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: margin,
      child: Text(
        dateFormat!.format(dateTime),
        style: textStyle,
      ),
    );
  }
}
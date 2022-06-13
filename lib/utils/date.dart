import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dart_date/dart_date.dart';

class MyDateUtils {
  ///Ex: 20-02-2020 - 22:10
  static String toDisplayString(BuildContext context, DateTime date) {
    DateFormat dateFormat = DateFormat(
        'dd-MM-yyyy – kk:mm', Localizations.localeOf(context).languageCode);
    return dateFormat.format(date);
  }

  ///Ex: Sun, 10 Apr 2021 | Sunday
  static String toDisplayString2(BuildContext context, DateTime date) {
    String pattern;

    if (date.toLocalTime.isSameDay(DateTime.now().toLocalTime)) {
      return AppLocalizations.of(context)!.today;
    } else if (isSameWeek(date.toLocalTime, DateTime.now())) {
      pattern = "EEEE";
    } else if (date.toLocal().year == DateTime.now().toLocal().year) {
      pattern = "dd MMM";
    } else {
      pattern = "dd MMM yyyy";
    }

    DateFormat dateFormat = DateFormat(pattern, Localizations.localeOf(context).languageCode);
    return dateFormat.format(date);
  }

  ///Ex: 2 days ago
  static String toDisplayString3(BuildContext context, DateTime date) {
    return timeago.format(date,
        locale: Localizations.localeOf(context).languageCode);
  }

  ///Ex: 20-02-2020 - 22:10
  static String timeToDisplayString(BuildContext context, DateTime date) {
    DateFormat dateFormat =
        DateFormat('H:mm', Localizations.localeOf(context).languageCode);
    return dateFormat.format(date);
  }

  static bool isSameWeek(DateTime date1, DateTime date2) {
    return date1.startOfWeek == date2.startOfWeek;
  }
}

class ViTimeLookupMessages extends timeago.LookupMessages {
  @override
  String aDay(int hours) {
    return "$hours giờ";
  }

  @override
  String aboutAMinute(int minutes) {
    return "$minutes phút";
  }

  @override
  String aboutAMonth(int days) {
    return "$days ngày";
  }

  @override
  String aboutAYear(int year) {
    return "$year năm";
  }

  @override
  String aboutAnHour(int minutes) {
    return "$minutes phút";
  }

  @override
  String days(int days) {
    return "$days ngày";
  }

  @override
  String hours(int hours) {
    return "$hours giờ";
  }

  @override
  String lessThanOneMinute(int seconds) {
    return "$seconds giây";
  }

  @override
  String minutes(int minutes) {
    return "$minutes phút";
  }

  @override
  String months(int months) {
    return "$months tháng";
  }

  @override
  String prefixAgo() {
    return "";
  }

  @override
  String prefixFromNow() {
    return "";
  }

  @override
  String suffixAgo() {
    return "trước";
  }

  @override
  String suffixFromNow() {
    return "kể từ hiện tại";
  }

  @override
  String years(int years) {
    return "$years năm";
  }
}

class MyTimeUtils {
  ///Ex: 32 hours 20 minutes
  static String toDisplayString(BuildContext context, int minutes) {
    var l10n = AppLocalizations.of(context)!;

    var time = Duration(minutes: minutes);

    var hourString = time.inHours > 1 ? l10n.hours : l10n.hours;

    var minuteTime = time - Duration(hours: time.inHours);
    var minuteString = minuteTime.inMinutes > 1 ? l10n.minutes : l10n.minute;

    return "${time.inHours} $hourString ${minuteTime.inMinutes} $minuteString";
  }

  ///Ex of [timeString] : 9:00
  static bool timeHasPassed(String timeString) {
    var time = TimeOfDay(
        hour: int.parse(timeString.split(":")[0]),
        minute: int.parse(timeString.split(":")[1]));

    var now = DateTime.now();
    var timeConverted =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);

    return timeConverted.isBefore(now);
  }
}

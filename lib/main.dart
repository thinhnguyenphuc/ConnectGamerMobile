import 'dart:io';

import 'package:connectgamermobile/data/network/signalr/signalr_controller.dart';


import 'package:connectgamermobile/ui/app.dart';
import 'package:connectgamermobile/utils/date.dart';
import 'package:connectgamermobile/view_models/common/notification_controller.dart';
import 'package:connectgamermobile/view_models/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  addTimeAgoLocales();

  await NotificationController().init();

  ///testing
  //await SignalRController().init();

  var themeViewModel = await ThemeViewModel.init();

  runApp(ChangeNotifierProvider(
    create: (_) => themeViewModel,
    child: const App(),
  ));
}

void addTimeAgoLocales() {
  timeago.setLocaleMessages("vi", ViTimeLookupMessages());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

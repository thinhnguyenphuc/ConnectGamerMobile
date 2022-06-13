import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:flutter/material.dart';

import 'notification_list.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> with StateVariablesMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: GradientBackgroundAppBar(
        data: GradientAppBarData(
          title: Text(l10n.notificationTitle),
        ),
      ).build(context),
      body: Ink(
        color: Theme.of(context).backgroundColor,
        child: const NotificationList(),
      ),
    );
  }
}


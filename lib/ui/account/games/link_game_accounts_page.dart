import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:flutter/material.dart';

import 'account_game_list.dart';

class LinkGameAccountsPage extends StatefulWidget {
  const LinkGameAccountsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LinkGameAccountsPageState();

}

class _LinkGameAccountsPageState extends State<LinkGameAccountsPage> with StateVariablesMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: GradientAppBar(
          data: GradientAppBarData(
            title: Text(l10n.linkGameTitle),
          )
      ).build(context),
      body: const AvailableGameList(),
    );
  }
  
}

class AvailableGameList extends StatelessWidget {
  const AvailableGameList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Strings.supportGameNames.length,
      itemBuilder: (context, index) {
        return GameItemButton(
          demoIndex: index,
          onPressed: () {},
          onIconPressed: () {},
          icon: const Icon(Icons.arrow_forward),
          margin: EdgeInsets.zero,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        );
      },
    );
  }

}
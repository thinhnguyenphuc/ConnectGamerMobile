import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account_game_list.dart';

class AccountGameTabView extends StatefulWidget {
  final EdgeInsets? padding;
  const AccountGameTabView({Key? key,
    this.padding,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccountGameTabViewState();

}

class _AccountGameTabViewState extends State<AccountGameTabView> {
  @override
  Widget build(BuildContext context) {
    return AccountGameList(
      padding: widget.padding,
    );
  }
}





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account_page.dart';

class AccountHomePage extends StatefulWidget {
  const AccountHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccountHomePageState();
}

class _AccountHomePageState extends State<AccountHomePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const AccountPage(id: "1");
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
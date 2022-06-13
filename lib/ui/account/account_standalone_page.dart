import 'package:connectgamermobile/ui/account/account_page.dart';
import 'package:flutter/material.dart';

class AccountStandalonePage extends StatelessWidget {
  const AccountStandalonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AccountPage(id: "2",)),
    );
  }

}
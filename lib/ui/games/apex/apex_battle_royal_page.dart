import 'package:connectgamermobile/ui/games/apex/apex_overview_page.dart';
import 'package:connectgamermobile/view_models/game/apex_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../custom_classes/mixins/base_widget_mixins.dart';
import '../../../models/game/apex/apex_profile.dart';

class ApexBattleRoyalPage extends StatefulWidget {
  const ApexBattleRoyalPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ApexBattleRoyalPageState();
}

class _ApexBattleRoyalPageState extends State<ApexBattleRoyalPage> with StateVariablesMixin{
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ApexViewModel>(context);
    final ApexProfile? _profile = viewModel.profile;

    super.build(context);
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _profile != null
              ? Column(
            children: [
              CustomCardView(
                title: l10n.battleRoyalTitle,
                rankImg: _profile.rank.rankImg,
                rankName: _profile.rank.rankName,
                rankNo: _profile.rank.ladderPosPlatform,
                rankScore: l10n.score +
                    ": " +
                    _profile.rank.rankScore.toString(),
                theme: theme,
              ),
            ],
          )
              : const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
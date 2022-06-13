import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../custom_classes/mixins/base_widget_mixins.dart';
import '../../../models/game/apex/apex_profile.dart';
import '../../../view_models/game/apex_view_model.dart';
import 'apex_overview_page.dart';

class ApexArenaPage extends StatefulWidget {
  const ApexArenaPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ApexArenaPageState();
}

class _ApexArenaPageState extends State<ApexArenaPage> with StateVariablesMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                title: l10n.arenasTitle,
                rankImg: _profile.arena.rankImg,
                rankName: _profile.arena.rankName,
                rankNo: _profile.arena.ladderPosPlatform,
                rankScore: l10n.score +
                    ": " +
                    _profile.arena.rankScore.toString(),
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
import 'package:connectgamermobile/models/game/pubg/duo_model.dart';
import 'package:connectgamermobile/view_models/game/pubg_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/game/pubg/pubg_profile.dart';

@optionalTypeArgs
mixin PUBGSuperClass{
  late PUBGViewModel viewModel;
  late PUBGProfile? profile;
  late List<Duo> duoList;
  late List<String> titleAttrDuoList;

  static TextStyle largeStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 25);

  @mustCallSuper
  Widget buildSuperClass(BuildContext context) {
    initSuperClass(context);
    return const _NullWidget();
  }

  void initSuperClass(BuildContext context) {

    viewModel = Provider.of<PUBGViewModel>(context);
    profile = viewModel.profile;

    duoList = profile != null
        ? [
            profile!.gameModeStats.duo,
            profile!.gameModeStats.duoFpp,
            profile!.gameModeStats.solo,
            profile!.gameModeStats.soloFpp
          ]
        : [];
  }
}

class _NullWidget extends StatelessWidget {
  const _NullWidget();

  @override
  Widget build(BuildContext context) {
    throw FlutterError(
      'Widgets that mix Base widgets for common variables must '
      'call super.build() but must ignore the return value of the superclass.',
    );
  }
}



List<String> iconPUBGData = [
  "assets/game_icons/trophy.png",
  "assets/game_icons/lose.png",
  "assets/game_icons/rate.png",
  "assets/game_icons/growth.png",
  "assets/game_icons/knife.png",
  "assets/game_icons/headshot.png",
  "assets/game_icons/goal.png",
  "assets/game_icons/distance.png",
  "assets/game_icons/all.png",
];
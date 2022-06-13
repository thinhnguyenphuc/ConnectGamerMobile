import 'package:connectgamermobile/models/game/fortnite/duo_model.dart';
import 'package:connectgamermobile/models/game/fortnite/fortnite_model.dart';
import 'package:connectgamermobile/view_models/game/fortnite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@optionalTypeArgs
mixin FortniteSuperClass{
  late FortniteViewModel viewModel;
  late FortniteProfile? profile;
  late List<String> titleAttrDuoList;

  static TextStyle largeStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 25);

  @mustCallSuper
  Widget buildSuperClass(BuildContext context) {
    initSuperClass(context);
    return const _NullWidget();
  }

  void initSuperClass(BuildContext context) {
    viewModel = Provider.of<FortniteViewModel>(context);
    profile = viewModel.profile;
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

class CustomCardView extends StatelessWidget {
  final ThemeData theme;
  final String title;
  final String detail;
  final String imageSrc;

  const CustomCardView(
      {Key? key,
        required this.title,
        required this.theme,
        required this.detail,
        required this.imageSrc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: theme.cardTheme.color,
      shadowColor: Colors.blueAccent,
      elevation: 5,
      child: ClipPath(
        child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: theme.primaryColor,
                  width: 5.0,
                ),
                right: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
                top: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
                bottom: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              color: theme.brightness == Brightness.light ? Colors.white : Colors.black,
            ),
            child: IntrinsicHeight(
                child: Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 20,
                              child: ClipOval(
                                child: Image.asset(imageSrc),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: Text(
                                title,
                                style: theme.textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      color: Colors.greenAccent,
                                      thickness: 5,
                                    )),
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(detail,
                                          style: theme.textTheme.bodyLarge),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]))),
      ),
    );
  }
}

String getAttribute(Duo duo, int index){
  switch (index) {
    case 0:
      return duo.top3.toString();
    case 1:
      return duo.top5.toString();
    case 2:
      return duo.top6.toString();
    case 3:
      return duo.top10.toString();
    case 4:
      return duo.top12.toString();
    case 5:
      return duo.top25.toString();
    case 6:
      return duo.score.toString();
    case 7:
      return duo.scorePerMin.toString();
    case 8:
      return duo.scorePerMatch.toString();
    case 9:
      return duo.wins.toString();
    case 10:
      return duo.kills.toString();
    case 11:
      return duo.killsPerMin.toString();
    case 12:
      return duo.killsPerMatch.toString();
    case 13:
      return duo.deaths.toString();
    case 14:
      return duo.kd.toString();
    case 15:
      return duo.matches.toString();
    case 16:
      return ("${duo.winRate.toString()}%");
    case 17:
      return duo.minutesPlayed.toString();
    case 18:
      return duo.playersOutlived.toString();
    case 19:
      return duo.lastModified.toIso8601String();
  }
  return "";
}

List<String> iconAsset = [
  "assets/game_icons/top3.png",
  "assets/game_icons/top5.png",
  "assets/game_icons/top6.png",
  "assets/game_icons/top10.png",
  "assets/game_icons/top12.png",
  "assets/game_icons/top25.png",
  "assets/game_icons/score.png",
  "assets/game_icons/score_per_min.png",
  "assets/game_icons/score_per_match.png",
  "assets/game_icons/trophy.png",
  "assets/game_icons/knife.png",
  "assets/game_icons/top6.png",
  "assets/game_icons/top10.png",
  "assets/game_icons/gravestone.png",
  "assets/game_icons/kd.png",
  "assets/game_icons/game.png",
  "assets/game_icons/growth.png",
  "assets/game_icons/frisbee.png",
  "assets/game_icons/athlete.png",
  "assets/game_icons/edit.png",
];

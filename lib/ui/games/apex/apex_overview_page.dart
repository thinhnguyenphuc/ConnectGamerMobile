import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/game/apex/apex_profile.dart';
import '../../../view_models/game/apex_view_model.dart';

class ApexOverViewPage extends StatefulWidget {
  const ApexOverViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ApexOverViewPageState();
}

const largeStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25);

class _ApexOverViewPageState extends State<ApexOverViewPage>
    with StateVariablesMixin {
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
                    Card(
                        color: theme.cardTheme.color,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: theme.primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child:
                        Column(mainAxisSize: MainAxisSize.min, children: <
                            Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(
                                        3.0, // Move to right 10  horizontally
                                        3.0, // Move to bottom 10 Vertically
                                      ),
                                      color: theme.brightness == Brightness.light ? Colors.white : Colors.black,
                                      blurRadius: 20.0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 15,
                                      child: ClipOval(
                                        child: Image.asset(
                                            "assets/images/killIcon.png"),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(l10n.kill),
                                          Text(_profile.kills.toString(),
                                              style: theme.textTheme.bodyLarge),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(
                                        5.0, // Move to right 10  horizontally
                                        5.0, // Move to bottom 10 Vertically
                                      ),
                                      color: theme.brightness == Brightness.light ? Colors.white : Colors.black,
                                      blurRadius: 20.0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 15,
                                      child: ClipOval(
                                        child: Image.asset(
                                            "assets/images/headshotIcon.png"),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(l10n.headshot),
                                          Text(_profile.headshots.toString(),
                                              style: theme.textTheme.bodyLarge),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ])),
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

class CustomCardView extends StatelessWidget {
  final ThemeData theme;
  final String title;
  final String rankImg;
  final String rankName;
  final String rankScore;
  final int rankNo;

  const CustomCardView(
      {Key? key,
      required this.title,
      required this.rankImg,
      required this.rankName,
      required this.rankNo,
      required this.rankScore,
      required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(
              2.0, // Move to right 10  horizontally
              2.0, // Move to bottom 10 Vertically
            ),
            color: Colors.grey,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Card(
          color: theme.cardTheme.color,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: theme.primaryColor, width: 1),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: IntrinsicHeight(
              child: Column(
                  children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width/4,
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
                              SizedBox(
                                  height: 100, child: VerticalDivider(color: theme.primaryColor, thickness: 10,)),
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 20,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: rankImg,
                                    placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(rankName, style: theme.textTheme.bodyLarge),
                                    Text(rankScore, style: theme.textTheme.bodyLarge),
                                    Text("#" + (rankNo > 0 ? rankNo.toString() : "No"),
                                        style: theme.textTheme.bodyMedium)
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
    );
  }
}

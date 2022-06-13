import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/ui/games/apex/apex_arena_page.dart';
import 'package:connectgamermobile/ui/games/apex/apex_overview_page.dart';
import 'package:connectgamermobile/view_models/game/apex_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../custom_classes/mixins/base_widget_mixins.dart';
import '../../../models/game/apex/apex_profile.dart';
import '../../../widgets/bars/gradient_tab_bar.dart';
import 'apex_battle_royal_page.dart';

///Basically create a nested scrollview
class ApexLegendsPage extends StatefulWidget {
  const ApexLegendsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ApexLegendsPageState();
}

class _ApexLegendsPageState extends State<ApexLegendsPage>
    with StateVariablesMixin {
  List<String> tabsName = [];

  @override
  void initState() {
    super.initState();
    Provider.of<ApexViewModel>(context, listen: false)
        .fetchProfile(Strings.demoApexInGame);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    tabsName = [l10n.overview,l10n.battleRoyalTitle, l10n.arenasTitle];

    return DefaultTabController(
      length: tabsName.length,
      child: _createBody(context),
    );
  }

  Widget _createBody(BuildContext context) {

    final backgroundColor = theme.cardColor;

    final viewModel = Provider.of<ApexViewModel>(context);

    final tabBar = GradientTabBarBuilder(
        context: context,
        data: GradientTabBarData(
          tabsName: tabsName,
          backgroundColor: backgroundColor,
        )).build(context);

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
                sliver: SliverAppBar(
              toolbarHeight: tabBar.preferredSize.height,
              titleSpacing: 0,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: ApexLegendsDetailsAppBar(
                  tabBarPadding: tabBar.preferredSize.height,
                  viewModel: viewModel,
                ),
              ),
              forceElevated: innerBoxIsScrolled,
              backgroundColor: theme.cardColor,
              pinned: true,
              floating: false,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: tabBar,
              ),
            )),
          )
        ];
      },
      body: TabBarView(
        children: [
          Material(
            child: Ink(
              color: theme.backgroundColor,
              child: const ApexOverViewPage(),
            ),
          ),
          Material(
            child: Ink(
              color: theme.backgroundColor,
              child: const ApexBattleRoyalPage(),
            ),
          ),
          Material(
            child: Ink(
              color: theme.backgroundColor,
              child: const ApexArenaPage(),
            ),
          ),
        ],
      ),
    );
  }
}

class ApexLegendsDetailsAppBar extends StatefulWidget {
  final double tabBarPadding;

  final ApexViewModel viewModel;

  const ApexLegendsDetailsAppBar({
    Key? key,
    this.tabBarPadding = 0,
    required this.viewModel,
  }) : super(key: key);

  @override
  _ApexLegendsDetailsAppBarState createState() =>
      _ApexLegendsDetailsAppBarState();
}

class _ApexLegendsDetailsAppBarState extends State<ApexLegendsDetailsAppBar>
    with StateVariablesMixin {
  final mediumStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25);

  final largeStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    ApexProfile? _profile = widget.viewModel.profile;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.srcOver),
            child: Image(
              image: const AssetImage("assets/game_backgrounds/apex_legends.png"),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
        ),
        _profile != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 5,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 50,
                            child: ClipOval(
                              child: _profile.avatar.isEmpty
                                  ? Image.asset("assets/images/userIconWhite.png")
                                  : CachedNetworkImage(
                                      imageUrl: _profile.avatar,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //InGameName
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 20,
                                        child: ClipOval(
                                            child: Icon(Icons.account_box)),
                                      ),
                                      Text(_profile.name, style: largeStyle),
                                    ],
                                  ),
                                  //Level
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 20,
                                        child: ClipOval(
                                            child: Icon(Icons.leaderboard)),
                                      ),
                                      Text("Level ${_profile.level}",
                                          style: mediumStyle),
                                    ],
                                  ),
                                  //Rank
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 20,
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl: _profile.rank.rankImg,
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Text(_profile.rank.rankName,
                                          style: mediumStyle)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ],
                  )
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
    );
  }
}

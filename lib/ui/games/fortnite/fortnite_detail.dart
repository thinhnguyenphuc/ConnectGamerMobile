import 'package:connectgamermobile/models/game/fortnite/fortnite_model.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/view_models/game/fortnite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../custom_classes/mixins/base_widget_mixins.dart';
import '../../../widgets/bars/gradient_tab_bar.dart';
import 'fortnite_duo_page.dart';
import 'fortnite_ltm_page.dart';
import 'fortnite_overview_page.dart';
import 'fortnite_solo_page.dart';
import 'fortnite_squad_page.dart';

class FortnitePage extends StatefulWidget {
  const FortnitePage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FortnitePageState();
}

class _FortnitePageState extends State<FortnitePage> with StateVariablesMixin {
  List<String> tabsName = [];

  @override
  void initState() {
    super.initState();
    Provider.of<FortniteViewModel>(context, listen: false)
        .fetchProfile(Strings.demoFortniteInGame);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    tabsName = [l10n.overall, l10n.solo, l10n.duo, l10n.squad, l10n.ltm];

    return DefaultTabController(
      length: tabsName.length,
      child: _createBody(context),
    );
  }

  Widget _createBody(BuildContext context) {
    final backgroundColor = theme.cardColor;

    final viewModel = Provider.of<FortniteViewModel>(context);

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
                    background: FortniteDetailsAppBar(
                      tabBarPadding: tabBar.preferredSize.height,
                      viewModel: viewModel,
                    ),
                  ),
                  forceElevated: innerBoxIsScrolled,
                  backgroundColor: theme.cardColor,
                  pinned: true,
                  floating: false,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(0),
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
              child: const FortniteOverViewPage(),
            ),
          ),
          Material(
            child: Ink(
              color: theme.backgroundColor,
              child: const FortniteSoloPage(),
            ),
          ),
          Material(
            child: Ink(
              color: theme.backgroundColor,
              child: const FortniteDuoPage(),
            ),
          ),
          Material(
            child: Ink(
              color: theme.backgroundColor,
              child: const FortniteSquadPage(),
            ),
          ),
          Material(
            child: Ink(
              color: theme.backgroundColor,
              child: const FortniteLTMPage(),
            ),
          ),
        ],
      ),
    );
  }
}

class FortniteDetailsAppBar extends StatefulWidget {
  final double tabBarPadding;

  final FortniteViewModel viewModel;

  const FortniteDetailsAppBar({
    Key? key,
    this.tabBarPadding = 0,
    required this.viewModel,
  }) : super(key: key);

  @override
  _FortniteDetailsAppBarState createState() => _FortniteDetailsAppBarState();
}

class _FortniteDetailsAppBarState extends State<FortniteDetailsAppBar>
    with StateVariablesMixin {
  final mediumStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25);

  final largeStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    FortniteProfile? profile = widget.viewModel.profile;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.srcOver),
            child: Image(
              image: const AssetImage("assets/game_backgrounds/fortnite.png"),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
        ),
        profile != null
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
                        const BorderRadius.all(Radius.circular(100))),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50,
                      child: ClipOval(
                          child: Image.asset(
                            "assets/images/userIconWhite.png",
                            fit: BoxFit.fill,)),
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
                                Text(profile.name, style: largeStyle),
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

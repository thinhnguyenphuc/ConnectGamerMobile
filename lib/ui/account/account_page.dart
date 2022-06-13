import 'package:badges/badges.dart';
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/data/user_info.dart';
import 'package:connectgamermobile/resources/routes.dart';
import 'package:connectgamermobile/ui/account/account_info_page.dart';
import 'package:connectgamermobile/ui/account/games/account_games_tab_view.dart';
import 'package:connectgamermobile/ui/post/posts_home_page.dart';
import 'package:connectgamermobile/utils/color.dart';
import 'package:connectgamermobile/utils/text.dart';
import 'package:connectgamermobile/widgets/buttons/gradient_border_icon_button.dart';
import 'package:connectgamermobile/widgets/bars/gradient_tab_bar.dart';
import 'package:connectgamermobile/widgets/images/circle_image.dart';
import 'package:flutter/material.dart';

import '../../models/user/user_info.dart';

///Basically create a nested scrollview
class AccountPage extends StatefulWidget {
  final String id;

  const AccountPage({Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> with StateVariablesMixin {

  List<String> tabsName = [];

  late final bool isSelf;

  @override
  void initState() {
    super.initState();
    checkIdIsSelf();
  }

  void checkIdIsSelf() {
    if (widget.id == "1") {
      isSelf = true;
    } else {
      isSelf = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    tabsName = [l10n.informationTabTitle, l10n.postTabTitle, l10n.gameTabTitle];

    return DefaultTabController(
      length: tabsName.length,
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final tabBarPadding = EdgeInsets.all(insets.large);

    final backgroundColor = theme.cardColor;

    final tabBar = GradientTabBarBuilder(
      context: context,
      data: GradientTabBarData(
        tabsName: tabsName,
        backgroundColor: backgroundColor,
      )
    ).build(context);

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              sliver:  SliverAppBar(
                toolbarHeight: tabBar.preferredSize.height,
                titleSpacing: 0,
                leading: Navigator.canPop(context)? GradientBorderIconButton(
                  backgroundColor: backgroundColor,
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                  borderWith: 2,
                  icon: const Icon(Icons.arrow_back),
                ): null,
                actions: _buildActions(context),
                expandedHeight: AccountInfoAppBar.height,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: AccountInfoAppBar(
                    tabBarPadding: tabBar.preferredSize.height,
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
              )
            ),
          )
        ];
      },
      body: TabBarView(
        children: [
          Ink(
            color: theme.backgroundColor,
            child: const AccountInfoPage(),
          ),
          Ink(
            color: theme.backgroundColor,
            child: PostList(
              padding: EdgeInsets.only(top: insets.large),
              hasCreatePostBtn: true,
            ),
          ),
          Ink(
            color: theme.backgroundColor,
            child: AccountGameTabView(
              padding: EdgeInsets.only(top: insets.large),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget>? _buildActions(BuildContext context) {

    final backgroundColor = theme.cardColor;

    final actionIconPadding = EdgeInsets.symmetric(horizontal: insets.normal);

    if (isSelf) {
      return [
        Padding(
          padding: actionIconPadding,
          child:  GradientBorderIconButton(
            backgroundColor: backgroundColor,
            onPressed: () {
              Navigator.pushNamed(context, Routes.notifications);
            },
            borderWith: 2,
            paintIconWithGradient: false,
            icon: Badge(
              badgeContent: Text("2",
                style: TextStyle(
                  fontSize: theme.textTheme.caption?.fontSize,
                  color: Colors.white,
                ),
              ),
              child: GradientUtils.paintWidget(context,  const Icon(Icons.notifications)),
            ),
          ),
        ),
        Padding(
          padding: actionIconPadding,
          child: GradientBorderIconButton(
            backgroundColor: backgroundColor,
            onPressed: () {
              Navigator.pushNamed(context, Routes.settings);
            },
            borderWith: 2,
            icon: const Icon(Icons.settings),
          ),
        ),
      ];
    } else {

    }
    return null;
  }
}

class AccountInfoAppBar extends StatefulWidget {

  static const double height = 400;

  final double tabBarPadding;

  const AccountInfoAppBar({Key? key,
    this.tabBarPadding = 0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccountInfoAppBarState();
}

class _AccountInfoAppBarState extends State<AccountInfoAppBar> with StateVariablesMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    const imageDiameter = 132.0;
    final componentsDistance = insets.large;

    final nameTextStyle = theme.textTheme.headline6;
    String  nameText = UserDetailInfo().getUserInfo().userName;

    final bottomPadding = insets.large + widget.tabBarPadding;
    final backgroundImageSize = AccountInfoAppBar.height
        - bottomPadding - componentsDistance - imageDiameter/2
        - TextWidgetUtils.textSizeOf(nameText, nameTextStyle ?? const TextStyle()).height;

    return Container(
      height: AccountInfoAppBar.height,
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image(
              image: const AssetImage("assets/images/placeHolder.png"),
              height: backgroundImageSize,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: imageDiameter,
                  height: imageDiameter,
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    shape: BoxShape.circle,
                  ),
                  child: CircleImage(
                    imagePath: "assets/images/placeHolder.png",
                    imageWidth: imageDiameter - insets.large,
                    imageHeight: imageDiameter - insets.large,
                    imageFit: BoxFit.cover,
                    onClickedCallback: () {},
                  ),
                ),
                SizedBox(height: componentsDistance,),
                Text(nameText,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: nameTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


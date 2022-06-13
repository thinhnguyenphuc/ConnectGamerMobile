import 'package:badges/badges.dart';
import 'package:connectgamermobile/custom_classes/extensions/navigator_extension.dart';
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/view_models/friend/friend_request_view_model.dart';
import 'package:connectgamermobile/widgets/bars/search_gradient_app_bar.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../resources/routes.dart';
import '../../view_models/friend/friend_home_view_model.dart';
import '../../widgets/bars/gradient_app_bar.dart';
import 'friend_list.dart';

class FriendHomePage extends StatefulWidget {
  const FriendHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FriendHomePageState();
}

class _FriendHomePageState extends State<FriendHomePage>
    with StateVariablesMixin, InitViewModelMixin<FriendHomeViewModel>, AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onNotificationChanged() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    initVariables(context);
    initViewModel(context);

    return Column(
      children: [
        SearchGradientAppBar(
          hintText: l10n.searchHintText,
          appBarData: GradientAppBarData(
            actionIsGradient: false,
            actions: [
              ThemeBaseGradientContainer(
                child: IconButton(
                  splashRadius: 24,
                  icon: const Icon(Icons.person_add_alt_1),
                  onPressed: () => Navigator.pushNamed(context, Routes.searchUsername),
                ),
              ),
              IconButton(
                splashRadius: 24,
                icon: Badge(
                  showBadge: false,
                  padding: EdgeInsets.all(insets.normal),
                  child:  const ThemeBaseGradientContainer(
                    child: Icon(Icons.notifications_rounded),
                  ),
                ),
                tooltip: l10n.friendRequestTitle,
                onPressed: () async {
                  NavigatorExtension.toFriendRequestPage(context);
                }
              )
            ],
            title: Text(l10n.friendPageTitle),
          ),
          onSearch: (value) {
            viewModel.search(value);
          },
        ),
        Expanded(
          child: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            displacement: insets.extraLarge,
            onRefresh: () async {
              viewModel.refresh();
              },
            child: FriendList(),
          ),
        )
      ],
    );
  }
}

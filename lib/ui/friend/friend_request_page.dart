import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/ui/account/notifications/notification_list.dart';
import 'package:connectgamermobile/utils/dialog.dart';
import 'package:connectgamermobile/view_models/friend/friend_request_view_model.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/friend/response/friend_request_response.dart';
import '../../view_models/friend/friend_home_view_model.dart';
import '../commons/custom_paged_list_view.dart';

class FriendRequestPage extends StatefulWidget {
  const FriendRequestPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FriendRequestState();
}

class _FriendRequestState extends State<FriendRequestPage> with StateVariablesMixin, InitViewModelMixin<FriendRequestViewModel> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    initViewModel(context);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: GradientBackgroundAppBar(
            data: GradientAppBarData(
              title: Text(l10n.friendRequestTitle),
            )
        ).build(context),
        body: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          displacement: insets.extraLarge,
          onRefresh: () async {
            viewModel.refresh();
          },
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomPagedListView(
      pagingController: viewModel.pagingController,
      itemBuilder: (context, FriendRequestResponse item, index) {
        return FriendRequestNotificationItem(
          data: item,
          isLoading: viewModel.isLoading(item.id),
          onAccept: () async {
            var result = await viewModel.acceptFriendRequest(item.id);

            if (result) {
              DialogUtils.showSuccess(context, text: "${l10n.friendRequestAcceptSuccess1} ${item.requesterName} ${l10n.friendRequestAcceptSuccess2}");
            } else {
              DialogUtils.showError(context, l10n.friendRequestAcceptFail);
            }
          },
          onDecline: () async {
            var result = await viewModel.declineFriendRequest(item.id);

            if (!result) {
              DialogUtils.showError(context, l10n.friendRequestDeclineFail);
            }
          },
        );
      },
    );
  }
}
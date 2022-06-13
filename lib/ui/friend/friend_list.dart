import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_full_info_response.dart';
import 'package:connectgamermobile/models/user/user_minimized_info.dart';
import 'package:connectgamermobile/resources/routes.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/resources/themes.dart';
import 'package:connectgamermobile/utils/date.dart';
import 'package:connectgamermobile/view_models/friend/friend_home_view_model.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:connectgamermobile/widgets/groups/identifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../custom_classes/extensions/navigator_extension.dart';
import '../../models/friend/friend.dart';
import '../../view_models/chat/chat_home_page_view_model.dart';
import '../../widgets/images/user_avatar.dart';
import '../commons/custom_paged_list_view.dart';

class FriendList extends StatelessWidget with StatelessVariablesMixin, InitViewModelMixin<FriendHomeViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    initViewModel(context);
    return CustomPagedListView(
      pagingController: viewModel.pagingController,
      itemBuilder: (context, Friend item, index) {
        return FriendListItem(
          friend: item,
          backgroundColor: index % 2 == 0? theme.backgroundColor: theme.scaffoldBackgroundColor,
        );
      },
    );
  }

}

class FriendListItem extends StatelessWidget with StatelessVariablesMixin {

  final Friend friend;

  final Color? backgroundColor;

  FriendListItem({Key? key,
    required this.friend,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return InkWell(
      splashFactory: InkRipple.splashFactory,
      onTap: () => NavigatorExtension.navigateToAccountPage(context),
      child: Ink(
        color: backgroundColor ?? theme.scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(insets.extraLarge, insets.large, insets.large, insets.large),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _createIdentifier(context),
              GradientContainer(
                child: IconButton(
                  splashRadius: 24,
                  onPressed: friend.roomId != null? () async {
                    final chatHomePageViewModel = Provider.of<ChatHomePageViewModel>(context, listen: false);

                    await NavigatorExtension.toChatRoom(context, chatHomePageViewModel.enterPrivateRoom(
                      ChatRoomFullInfoResponse.createPseudo(friend.roomId!,
                        UserMinimizedInfo(Strings.testUsername, null, Strings.testUsername),
                        UserMinimizedInfo(friend.userName, friend.avatar, friend.displayName),
                      )
                    ));

                    chatHomePageViewModel.exitRoom();
                  }: null,
                  icon: const Icon(Icons.message),
                ),
                gradient: Themes.getGradientFrom(theme),
              )
            ],
          ),
        )
      ),
    );
  }

  Widget _createIdentifier(BuildContext context) {
    return Identifier(
      title: friend.displayName ?? friend.userName,
      avatar: friend.avatar,
      isOnline: friend.isOnline,
      backgroundColor: backgroundColor,
    );
  }

}
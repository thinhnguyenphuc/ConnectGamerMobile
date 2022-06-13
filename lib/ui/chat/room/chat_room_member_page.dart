import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/models/user/user_minimized_info.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/ui/commons/loading_row_widget.dart';
import 'package:connectgamermobile/view_models/chat/chat_room_view_models.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:connectgamermobile/widgets/controllers/multi_select_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../custom_classes/extensions/navigator_extension.dart';
import '../../../view_models/common/fetch_state.dart';
import '../../../widgets/containers/multi_select_container.dart';
import '../../../widgets/images/user_avatar.dart';

class ChatRoomMemberPage extends StatefulWidget {
  const ChatRoomMemberPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatRoomMemberPageState();
}

class _ChatRoomMemberPageState extends State<ChatRoomMemberPage>
    with StateVariablesMixin, InitViewModelMixin<ChatRoomViewModel> {
  @override
  void initState() {
    var viewModel = Provider.of<ChatRoomViewModel>(context, listen: false);
    viewModel.multiSelectController.refresh();
    viewModel.multiSelectController.addListener(_onMultiSelectChange);
    super.initState();
  }

  @override
  void dispose() {
    viewModel.multiSelectController.removeListener(_onMultiSelectChange);
    super.dispose();
  }

  void _onMultiSelectChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    initViewModel(context);

    viewModel.multiSelectController.validateItems(viewModel.roomInfo.users!);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return !viewModel.multiSelectController.isSelecting
        ? GradientAppBar(
            data: GradientAppBarData(
                title: Text(l10n.chatRoomMemberTitle),
                elevation: 0,
                actions: [
                IconButton(
                  onPressed: viewModel.editUsersState == FetchState.loading || viewModel.roomInfo.roomMasterName != Strings.testUsername? null: () async {
                    final userNames = await NavigatorExtension.toAddNewFriendToChatRoom(context, viewModel.roomInfo.userNames);

                    if (userNames != null) {
                      viewModel.addUsersToRoom(userNames);
                    }
                  },
                  tooltip: viewModel.roomInfo.roomMasterName != Strings.testUsername? l10n.notRoomMasterMessage: null,
                  icon: Icon(viewModel.roomInfo.roomMasterName != Strings.testUsername? Icons.person_add_disabled: Icons.person_add),
                ),
              ])).build(context)
        : GradientAppBar(
            data: GradientAppBarData(
                title: Text(l10n.removeMemberFromRoomTitle),
                elevation: 0,
                actions: [
                  IconButton(
                    splashRadius: 24,
                    onPressed: viewModel.editUsersState == FetchState.loading && viewModel.multiSelectController.isSelecting
                        ? null
                        : () => viewModel.removeUsersFromRoom(viewModel.multiSelectController.selectedItem.map((e) => e.userName).toList()),
                    icon: const Icon(Icons.delete),
                  ),
                ],
                leading: ThemeBaseGradientContainer(
                  child: IconButton(
                    splashRadius: 24,
                    onPressed: () {
                      viewModel.multiSelectController.clearAll();
                    },
                    icon: Icon(Icons.close),
                  ),
                ))).build(context);
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        LoadingRowWidget(
          show: viewModel.editUsersState == FetchState.loading,
          text: l10n.editingUsersInChatRoomMessage,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.roomInfo.users!.length,
            itemBuilder: (context, index) {
              final user = viewModel.roomInfo.users![index];
              return MultiSelectContainer(
                data: user,
                controller: viewModel.multiSelectController,
                index: index,
                content: Row(
                  children: [
                    UserAvatar(
                      avatar: user.avatar,
                    ),
                    SizedBox(
                      width: insets.large,
                    ),
                    Text(user.displayName ?? user.userName),
                  ],
                ),
                selectDisabled: user.userName == Strings.testUsername || Strings.testUsername != viewModel.roomInfo.roomMasterName,
              );
            },
          ),
        )
      ],
    );
  }
}

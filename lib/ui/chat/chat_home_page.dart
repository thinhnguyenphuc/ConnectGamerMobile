import 'package:connectgamermobile/custom_classes/extensions/navigator_extension.dart';
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/routes.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/ui/commons/custom_paged_list_view.dart';
import 'package:connectgamermobile/ui/commons/loading_row_widget.dart';
import 'package:connectgamermobile/utils/dialog.dart';
import 'package:connectgamermobile/utils/message.dart';
import 'package:connectgamermobile/view_models/chat/chat_home_page_view_model.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:connectgamermobile/widgets/bars/search_gradient_app_bar.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:connectgamermobile/widgets/groups/chat_room_identifier.dart';
import 'package:connectgamermobile/widgets/images/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../models/chat/response/chat_room_full_info_response.dart';
import '../../widgets/snack_bars/room_info_notification_snack_bar.dart';

class ChatHomePage extends StatefulWidget {
  const ChatHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChatHomePageState();
}

class ChatHomePageState extends State<ChatHomePage> with StateVariablesMixin, InitViewModelMixin<ChatHomePageViewModel>, AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    initVariables(context);
    initViewModel(context);

    return Column(
      children: [
        SearchGradientAppBar(
          appBarData: GradientAppBarData(
            title: Text(l10n.chatHomePageTitle),
            actions: [
              IconButton(
                onPressed: () async =>
                  _addChatRoom(context, await NavigatorExtension.toAddChatRoomPage<List<Object>>(context)),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          hintText: l10n.searchRoomHintText,
          onSearch: (value) {
            viewModel.search(value);
          },
        ),
        _buildAddingRoomWidget(context),
        Expanded(
          child: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            displacement: insets.extraLarge,
            onRefresh: () async {
              viewModel.refresh();
            },
            child: CustomPagedListView(
              pagingController: viewModel.pagingController,
              itemBuilder: (BuildContext context, ChatRoomFullInfoResponse item, int index) {
                return ChatListItem(
                  data: item,
                );
              },
            ),
          ),
        )
      ],
    );
  }

  void _addChatRoom(BuildContext context, List<Object>? returnResults) async {
    if (returnResults != null && returnResults.isNotEmpty) {
      String name = "";
      if (returnResults.length == 2) {
        name = returnResults[1] as String;
      }

      var addingResult = await Provider.of<ChatHomePageViewModel>(context, listen: false)
          .addChatRoom(name.isEmpty? null: name, returnResults[0] as List<String>);

      if (addingResult == null) {
        DialogUtils.showError(context, l10n.addChatRoomFail);
      }
    }
  }


  Widget _buildAddingRoomWidget(BuildContext context) {
    var show = Provider.of<ChatHomePageViewModel>(context).isAddingRoom;
    return LoadingRowWidget(
      show: show,
      text: l10n.addingChatRoomText,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class ChatListItem extends StatelessWidget with StatelessVariablesMixin {
  final ChatRoomFullInfoResponse data;

  ChatListItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      onTap: () async {
        final viewModel = Provider.of<ChatHomePageViewModel>(context, listen: false);
        await NavigatorExtension.toChatRoom(context, viewModel.enterRoom(data));
        viewModel.exitRoom();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: insets.large, horizontal: insets.extraLarge),
        child: ChatRoomIdentifier(
          shouldShowMessage: true,
          data: data,
        ),
      ),
    );
  }
}

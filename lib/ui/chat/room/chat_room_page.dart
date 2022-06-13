import 'package:connectgamermobile/custom_classes/extensions/navigator_extension.dart';
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/models/chat/response/chat_message_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_full_info_response.dart';

import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/resources/themes.dart';
import 'package:connectgamermobile/ui/chat/room/indicators/empty_message_indicator.dart';
import 'package:connectgamermobile/ui/commons/custom_paged_list_view.dart';
import 'package:connectgamermobile/utils/date.dart';
import 'package:connectgamermobile/utils/text.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:connectgamermobile/widgets/containers/sticky_bottom_container.dart';
import 'package:connectgamermobile/widgets/containers/text_field_unfocused_wrapper.dart';
import 'package:connectgamermobile/widgets/groups/chat_room_identifier.dart';
import 'package:connectgamermobile/widgets/images/circle_image.dart';
import 'package:connectgamermobile/widgets/images/user_avatar.dart';
import 'package:connectgamermobile/widgets/text_fields/chat_text_field.dart';
import 'package:connectgamermobile/widgets/texts/time_stamp.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../resources/themes.dart';
import '../../../view_models/chat/chat_room_view_models.dart';
import '../chat_components.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatRoomPageState();

}

class _ChatRoomPageState extends State<ChatRoomPage> with StateVariablesMixin, InitViewModelMixin<ChatRoomViewModel> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    initViewModel(context);

    final gradient = Themes.getGradientFrom(Theme.of(context));

    return TextFieldUnfocusedWrapper(
      child: Scaffold(
        appBar: GradientAppBar(
          titleIsGradient: false,
          data: GradientAppBarData(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,
                  )
              ),
              IconButton(
                  onPressed: () => NavigatorExtension.openChatRoomInfo(context, viewModel),
                  icon: const Icon(
                    Icons.info,
                  )
              ),
              // PopupMenuButton<String>(
              //   onSelected: (value) {},
              //   itemBuilder: (BuildContext context) {
              //     return {'Logout', 'Settings'}.map((String choice) {
              //       return PopupMenuItem<String>(
              //         value: choice,
              //         child: Text(choice),
              //       );
              //     }).toList();
              //   },
              // )
            ],
            titleSpacing: insets.normal,
            title: ChatRoomIdentifier(
              data: viewModel.roomInfo,
              avatarSize: 42,
              textStyle: theme.textTheme.bodyText1,
            ),
          )
        ).build(context),
        body: CustomPagedListView(
          pagingController: viewModel.pagingController,
          scrollController: _scrollController,
          reverse: true,
          itemBuilder: (context,ChatMessageResponse item, index) {
            return ChatBubble(
              key: Key(item.createdAt.toIso8601String()),
              data: item,
              isOldestMessage: viewModel.isOldestMessageOfUser(item, index),
              isNewestMessage: viewModel.isNewestMessageOfUser(item, index),
              onErrorLongTap: (data) {
                viewModel.resendMessage(data);
              },
              isPrivate: viewModel.roomInfo.isPrivate,
            );
          },
          noItemsFoundIndicatorBuilder: (context) => EmptyMessageIndicator(),
        ),
        bottomNavigationBar: StickyBottomContainer(
          child: ChatTextField(
            onSend: (value) {
              if (value.isNotEmpty) {
                viewModel.sendMessage(value);
              }
            },
          ),
        ),

      ),
    );
  }

}
import 'package:connectgamermobile/custom_classes/extensions/navigator_extension.dart';
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/view_models/chat/chat_room_view_models.dart';
import 'package:connectgamermobile/view_models/common/fetch_state.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:connectgamermobile/widgets/dialogs/edit_text_dialog.dart';
import 'package:connectgamermobile/widgets/groups/chat_room_identifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../resources/strings.dart';
import '../../../widgets/bars/gradient_app_bar.dart';
import '../../../widgets/groups/simple_setting_tile.dart';

class ChatRoomInfoPage extends StatefulWidget {
  const ChatRoomInfoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatRoomInfoPageState();
}

class _ChatRoomInfoPageState extends State<ChatRoomInfoPage> with StateVariablesMixin, InitViewModelMixin<ChatRoomViewModel> {

  final TextEditingController _roomNameTEC = TextEditingController();

  @override
  void dispose() {
    _roomNameTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    initViewModel(context);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return GradientAppBar(
      data: GradientAppBarData(
        elevation: 0,
      )
    ).build(context);
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ChatRoomAvatar(
              data: viewModel.roomInfo,
              avatarSize: 64,
            ),
            SizedBox(height: insets.extraLarge,),
            viewModel.editNameState != FetchState.loading? GestureDetector(
              onTap: viewModel.roomInfo.isPrivate || viewModel.roomInfo.roomMasterName != Strings.testUsername? null: () => editName(context),
              child: SizedBox(
                height: 36,
                width: double.infinity,
                child: Text(
                  viewModel.roomInfo.isPrivate
                      ? viewModel.roomInfo.users![viewModel.roomInfo.users![0].userName == Strings.testUsername? 1: 0].userName
                      :viewModel.roomInfo.name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.headline5,
                ),
              ),
            ): SizedBox(
              height: 36,
              width: 36,
              child: const ThemeBaseGradientContainer(
                child: LoadingIndicator(
                  indicatorType: Indicator.circleStrokeSpin,
                ),
              ),
            ),
            SizedBox(height: insets.extraLarge,),
            ..._buildSettings(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSettings(BuildContext context) {
    final padding = EdgeInsets.symmetric(horizontal: insets.large, vertical: insets.extraLarge);
    return [
      if (viewModel.roomInfo.isPrivate) SimpleSettingTile(
        padding: padding,
        title: l10n.profileTitle,
        leadingIcon: const ThemeBaseGradientContainer(
          child: Icon(Icons.person_sharp),
        ),
        onTap: () => NavigatorExtension.navigateToAccountPage(context),
        endIcon: const ThemeBaseGradientContainer(
          child: Icon(Icons.arrow_forward_ios),
        ),
      ),

      if (!viewModel.roomInfo.isPrivate) SimpleSettingTile(
        padding: padding,
        title: l10n.chatRoomMemberTitle,
        leadingIcon: const ThemeBaseGradientContainer(
          child: Icon(Icons.people),
        ),
        onTap: () => NavigatorExtension.toChatRoomMemberPage(context, viewModel),
        endIcon: ThemeBaseGradientContainer(
          child: Row(
            children: [
              Text(
                viewModel.roomInfo.users?.length.toString() ?? "",
                style: theme.textTheme.bodyText1,
              ),
              const Icon(Icons.person)
            ],
          ),
        ),
      ),

      SizedBox(height: insets.extraLarge,),

      if (!viewModel.roomInfo.isPrivate) SimpleSettingTile(
        padding: padding,
        title: l10n.exitRoomTitle,
        leadingIcon: const ThemeBaseGradientContainer(
          child: Icon(Icons.logout),
        ),
        onTap: () {},
      ),

    ];
  }

  void editName(BuildContext context) async {
    _roomNameTEC.text = viewModel.roomInfo.name;
    var result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return EditTextDialog(
          controller: _roomNameTEC,
          title: l10n.editChatRoomNameDialogTitle,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return l10n.roomNameFieldError;
            } else if (value == viewModel.roomInfo.name) {
              return l10n.roomNameFieldError2;
            }
            return null;
          },
          hintText: l10n.roomNameFieldHint,
        );
      }
    );

    if (result != null && result) {
      viewModel.editRoomName(_roomNameTEC.text);
    }
  }
}


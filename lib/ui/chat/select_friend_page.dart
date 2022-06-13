import 'package:connectgamermobile/custom_classes/extensions/navigator_extension.dart';
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/ui/commons/added_user_widget.dart';
import 'package:connectgamermobile/ui/commons/custom_paged_list_view.dart';
import 'package:connectgamermobile/view_models/chat/select_friend_view_model.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:connectgamermobile/widgets/bars/search_gradient_app_bar.dart';
import 'package:connectgamermobile/widgets/bars/text_field_gradient_app_bar.dart';
import 'package:connectgamermobile/widgets/buttons/gradient_button.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:connectgamermobile/widgets/dialogs/edit_text_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/friend/friend.dart';
import '../../widgets/images/user_avatar.dart';

///Currently this page default is to add new chat room
///use [overrideActionIcon] to only return the selected friends
class SelectFriendPage extends StatefulWidget {

  /// if [overrideActionIcon] != null, it will return selected users immediately on press
  final Icon? overrideActionIcon;

  const SelectFriendPage({Key? key,
    this.overrideActionIcon,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectFriendPageState();
}

class _SelectFriendPageState extends State<SelectFriendPage> with StateVariablesMixin, InitViewModelMixin<SelectFriendViewModel> {

  final TextEditingController _nameTEC = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _nameTEC.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    initViewModel(context);

    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SearchGradientAppBar(
        hintText: l10n.searchUsernameHintText,
        alwaysShowSearch: true,
        onSearch: (value) {
          viewModel.onSearch(value);
        },
        appBarData: GradientAppBarData(
            actions: [
              widget.overrideActionIcon != null ? IconButton(
                icon: ThemeBaseGradientContainer(child: widget.overrideActionIcon!),
                onPressed: () {
                  Navigator.pop(context, Provider.of<SelectFriendViewModel>(context, listen: false).addedUserNames);
                },
              ): TextButton(
                onPressed: Provider.of<SelectFriendViewModel>(context).addedUsers.length >= 2? () async {
                  if (await showCreateDialog(context)) {
                    Navigator.pop(context, [Provider.of<SelectFriendViewModel>(context, listen: false).addedUserNames, _nameTEC.text]);
                  }
                }: null,
                child: Text(
                  l10n.createRoomBtnTitle,
                  style: TextStyle(
                    fontSize:  theme.textTheme.caption?.fontSize,
                  ),
                ),
              )
            ]
        )
    );
  }

  Widget _buildBody(BuildContext context) {
    final viewModel = Provider.of<SelectFriendViewModel>(context);
    return Column(
      children: [
        _buildAppBar(context),
        if (viewModel.addedUsers.isNotEmpty) Padding(
          padding: EdgeInsets.symmetric(vertical: insets.large),
          child: AddedUserWidget(
            users: viewModel.addedUsers,
            listKey: viewModel.addedListKey,
            onDeleteItem: (value) {
              return viewModel.removeFromAddedUsers(value);
            },
          ),
        ),
        Expanded(
          child: _AvailableUserList(
            onAdd: (value) {
              viewModel.insertedToAddedUsers(value);
            },
          ),
        ),

      ],
    );
  }

  Future<bool> showCreateDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return EditTextDialog(
          controller: _nameTEC,
          title: l10n.createChatRoomDialogTitle,
          hintText: l10n.roomNameFieldHint,
        );
      }
    );
  }
}

class _AvailableUserList extends StatefulWidget {
  
  final void Function(Friend)? onAdd;

  const _AvailableUserList({Key? key,
    this.onAdd,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() => _AvailableUserListState();

}

class _AvailableUserListState extends State<_AvailableUserList> with StateVariablesMixin{

  late SelectFriendViewModel _viewModels;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    _viewModels = Provider.of<SelectFriendViewModel>(context);

    return _buildList(context);
  }

  Widget _buildList(BuildContext context) {
    return CustomPagedListView<int, Friend>(
      pagingController: _viewModels.pagingController,
      itemBuilder: (context, item, index) {
        return _buildItem(context, item);
      },
      onRefresh: () => _viewModels.refresh(),
    );
  }

  Widget _buildItem(BuildContext context, Friend user) {
    final userIsAdded = _viewModels.userIsAdded(user);

    double iconSize = 24;

    final iconPadding = insets.large;

    final leftComponentMaxWidth = MediaQuery.of(context).size.width - insets.large*2 - iconSize - iconPadding * 2 - insets.large;


    return Padding(
        padding: EdgeInsets.all(insets.large),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: leftComponentMaxWidth
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => NavigatorExtension.navigateToAccountPage(context),
                    child: UserAvatar(
                      radius: 24,
                      avatar: user.avatar
                    )
                  ),
                  SizedBox(width: insets.large,),
                  Expanded(
                    child: Text(
                      user.displayName ?? user.userName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
            userIsAdded? GestureDetector(
              onTap: null,
              child: Padding(
                child:  Icon(
                  Icons.check,
                  color: Colors.green,
                  size: iconSize,
                ),
                padding: EdgeInsets.all(iconPadding),
              ),
            ): ThemeBaseGradientContainer(
              child: IconButton(
                splashRadius: iconSize,
                padding: EdgeInsets.all(iconPadding),
                icon: const Icon(Icons.add),
                iconSize: iconSize,
                onPressed: () {
                  widget.onAdd?.call(user);
                },
              ),
            )
          ],
        )
    );
  }
}
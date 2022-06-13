import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:connectgamermobile/widgets/images/user_avatar.dart';
import 'package:flutter/material.dart';

import '../../custom_classes/mixins/base_widget_mixins.dart';
import '../../models/friend/friend.dart';

class AddedUserWidget extends StatelessWidget with StatelessVariablesMixin {
  final List<Friend> users;

  final bool Function(Friend)? onDeleteItem;

  /// >= [_minItemHeight]
  double itemHeight;
  final double _minItemHeight = 64;

  final GlobalKey<AnimatedListState>? listKey;

  AddedUserWidget({
    Key? key,
    required this.users,
    this.onDeleteItem,
    this.itemHeight = 64,
    this.listKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: itemHeight,
      child: AnimatedList(
        key: listKey,
        padding: const EdgeInsets.symmetric(),
        scrollDirection: Axis.horizontal,
        initialItemCount: users.length,
        itemBuilder: (BuildContext context, int index, animation) {
          return _buildItem(context, users[index], animation);
        },
      ),
    );
  }

  void validateFields() {
    itemHeight = itemHeight >= _minItemHeight ? itemHeight : _minItemHeight;
  }

  Widget _buildItem(
      BuildContext context, Friend user, Animation<double> animation) {
    return _AddedUserItemWidget(
      key: Key(user.userName),
      user: user,
      onDeleteItem: (value) => _removeAnimatedItem(context, user),
      itemHeight: itemHeight,
      animation: animation,
    );
  }

  void _removeAnimatedItem(BuildContext context, Friend user) {
    int index = users.indexOf(user);
    if (onDeleteItem?.call(user) ?? true) {
      AnimatedList.of(context).removeItem(
          index, (context, animation) => _buildItem(context, user, animation));
    }
  }
}

class _AddedUserItemWidget extends StatelessWidget
    with StatelessVariablesMixin {
  Friend user;
  final void Function(Friend)? onDeleteItem;
  final double itemHeight;
  final double avatarGap;
  final Animation<double> animation;

  _AddedUserItemWidget({
    Key? key,
    required this.user,
    this.onDeleteItem,
    required this.itemHeight,
    this.avatarGap = 4,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return _buildSmall(context);
  }

  Widget _buildLarge(BuildContext context) {
    var content = Row(
      children: [
        Container(
          height: itemHeight,
          alignment: Alignment.center,
          width: itemHeight,
          child: UserAvatar(
            radius: itemHeight / 2 - avatarGap,
            avatar: user.avatar,
          ),
        ),
        SizedBox(
          width: insets.normal,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: Text(
            user.displayName ?? user.userName,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          width: insets.normal,
        ),
        ThemeBaseGradientContainer(
          child: IconButton(
            onPressed: () {
              onDeleteItem?.call(user);
            },
            icon: const Icon(Icons.cancel_outlined),
            splashRadius: 24,
          ),
        ),
      ],
    );

    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        sizeFactor: animation,
        axis: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: insets.large),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(itemHeight),
              color: theme.brightness == Brightness.light
                  ? Colors.grey.shade300
                  : Colors.grey.shade800,
            ),
            child: content,
          ),
        ),
      ),
    );
  }

  Widget _buildSmall(BuildContext context) {
    var deleteBtnSize = 24.0;

    var content = InkWell(
      onTap: () {
        onDeleteItem?.call(user);
      },
      borderRadius: BorderRadius.circular(deleteBtnSize * 2),
      child: Stack(
        children: [
          Container(
            height: itemHeight,
            alignment: Alignment.center,
            width: itemHeight,
            child: UserAvatar(
              radius: itemHeight / 2 - 4,
              avatar: user.avatar,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Card(
                elevation: 4,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(deleteBtnSize),
                ),
                child: ClipOval(
                  child: SizedBox(
                    width: deleteBtnSize,
                    height: deleteBtnSize,
                    child: ThemeBaseGradientContainer(
                      child: Icon(
                        Icons.close,
                        size: deleteBtnSize - 4,
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );

    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        sizeFactor: animation,
        axis: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: insets.large),
          child: content,
        ),
      ),
    );
  }
}

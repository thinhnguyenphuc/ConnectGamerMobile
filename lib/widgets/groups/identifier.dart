
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:flutter/material.dart';

import '../images/user_avatar.dart';

///Group of widgets contain: a circle avatar, title and a subtitle
class Identifier extends StatelessWidget with StatelessVariablesMixin {

  final String? avatar;
  final void Function()? onPressed;

  final String title;
  final TextStyle? titleTextStyle;

  final EdgeInsets contentPadding;

  final Widget? subtitle;

  final bool? isOnline;

  final double avatarRadius;

  final Color? backgroundColor;

  Identifier({Key? key,
    this.avatar,
    this.onPressed,

    required this.title,
    this.titleTextStyle,
    this.subtitle,

    this.contentPadding = EdgeInsets.zero,

    this.isOnline,

    this.avatarRadius = 24,
    this.backgroundColor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          _buildImage(context, avatar),
          SizedBox(width: insets.large,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleTextStyle ?? theme.textTheme.bodyText1,
              ),
              if (subtitle != null) ...[
                SizedBox(height: insets.normal),
                subtitle!,
              ],
            ],
          )
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, String? avatar) {
    double isOnlineAvatarSize = 48;

    final avatarWidget = UserAvatar(
      avatar: avatar,
      radius: isOnline != null ? isOnlineAvatarSize :avatarRadius,
    );

    if (isOnline == null) {
      return avatarWidget;
    }

    const double onlineIconSize = 12;
    const double iconGap = 2;

    return SizedBox(
      height: isOnlineAvatarSize,
      width: isOnlineAvatarSize,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Center(
            child: avatarWidget,
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: onlineIconSize + iconGap,
              width: onlineIconSize + iconGap,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
              ),
              child: Icon(Icons.circle,
                color: isOnline! ? Colors.green: Colors.grey,
                size: onlineIconSize,
              ),
            ),
          )
        ],
      ),
    );
  }
}

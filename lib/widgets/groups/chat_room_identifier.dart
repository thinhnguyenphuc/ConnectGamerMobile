import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/models/chat/response/chat_message_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_full_info_response.dart';
import 'package:connectgamermobile/models/user/user_minimized_info.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/utils/date.dart';
import 'package:connectgamermobile/widgets/images/user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../images/circle_image.dart';
import '../images/double_circle_image.dart';

class ChatRoomIdentifier extends StatelessWidget with StatelessVariablesMixin {

  final ChatRoomFullInfoResponse data;

  final double avatarSize;

  final TextStyle? textStyle;

  final bool shouldShowMessage;

  ChatRoomIdentifier({Key? key,
    required this.data,
    this.avatarSize = 54,
    this.textStyle,
    this.shouldShowMessage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChatRoomAvatar(
          data: data,
          avatarSize: avatarSize,
        ),
        SizedBox(width: insets.large,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.isPrivate
                    ? data.users![data.users![0].userName == Strings.testUsername? 1: 0].userName
                    :data.name,
                style: textStyle ?? TextStyle(
                    fontSize: theme.textTheme.headline6?.fontSize
                ),
                overflow: TextOverflow.ellipsis,
              ),
              if (shouldShowMessage && data.messages!.isNotEmpty) ...[
                SizedBox(height: insets.large,),
                _buildClosestMessage(context, data.messages!.first)
              ],
            ],
          ),
        )
      ],
    );
  }

  Widget _buildClosestMessage(BuildContext context, ChatMessageResponse message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                children: [
                  if (message.sender.userName != Strings.testUsername && !data.isPrivate) TextSpan(
                      text: "${message.sender.userName}: ",
                      style: theme.textTheme.bodyText1?.merge(TextStyle(fontSize: theme.textTheme.caption?.fontSize))
                  ),
                  if (message.sender.userName == Strings.testUsername) TextSpan(
                      text: "${l10n.youText}: ",
                      style: theme.textTheme.bodyText1?.merge(TextStyle(fontSize: theme.textTheme.caption?.fontSize))
                  ),
                  TextSpan(
                      text: message.message,
                      style: theme.textTheme.bodyText2?.merge(TextStyle(fontSize: theme.textTheme.caption?.fontSize))
                  ),
                ]
            ),
          ),
        ),
        Text(
          "· ${MyDateUtils.toDisplayString3(context, message.createdAt)}",
          style: theme.textTheme.bodyText2?.merge(TextStyle(fontSize: theme.textTheme.caption?.fontSize)),
        )
      ],
    );
  }
}

class ChatRoomAvatar extends StatelessWidget {
  final ChatRoomFullInfoResponse data;
  final double avatarSize;
  final void Function()? onTap;

  const ChatRoomAvatar({Key? key,
    required this.data,
    this.avatarSize = 48,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: data.avatar != null ? CircleAvatar(
        radius: avatarSize /2,
        foregroundImage: NetworkImage(data.avatar!),
      ): _buildAlternateAvatar(context),
    );
  }

  Widget _buildAlternateAvatar(BuildContext context) {
    if (data.users != null) {
      if (data.isPrivate) {
        String? avatar = data.users![data.users![0].userName == Strings.testUsername? 1: 0].avatar;
        return UserAvatar(
          avatar: avatar,
          radius: avatarSize / 2,
        );
      }

      if (data.users!.length > 2) {
        return DoubleCircleImage(
          firstAvatar: data.users![0].avatar,
          secondAvatar: data.users![1].avatar,
          size: avatarSize,
        );
      } else if (data.users!.length == 2) {
        String? avatar = data.users![data.users![0].userName == Strings.testUsername? 1: 0].avatar;
        return UserAvatar(
          avatar: avatar,
          radius: avatarSize / 2,
        );
      } else {
        return CircleImage(
          imagePath: AssetPaths.defaultPersonAvatar,
          imageHeight: avatarSize,
          imageWidth: avatarSize,
          imageFit: BoxFit.fill,
        );
      }
    } else {
      return SizedBox.shrink();
    }
  }
}
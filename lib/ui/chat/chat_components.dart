import 'package:connectgamermobile/widgets/buttons/gradient_button.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:flutter/material.dart';

import '../../custom_classes/mixins/base_widget_mixins.dart';
import '../../models/chat/response/chat_message_response.dart';
import '../../resources/strings.dart';
import '../../resources/themes.dart';
import '../../utils/date.dart';
import '../../utils/text.dart';
import '../../widgets/images/user_avatar.dart';

class ChatBubble extends StatelessWidget with StatelessVariablesMixin {

  ///True if this is the last message in a group of continuous messages of a person
  final bool isOldestMessage;

  ///opposite of [isOldestMessage]
  final bool isNewestMessage;

  final ChatMessageResponse data;

  Function(ChatMessageResponse)? onErrorLongTap;

  final bool isPrivate;

  ChatBubble({Key? key,
    this.isOldestMessage = true,
    required this.data,
    this.isNewestMessage = true,
    this.onErrorLongTap,
    required this.isPrivate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    bool isSender = data.sender.userName == Strings.testUsername;

    final avatarSize = 24.0;
    final avatarPadding = insets.normal;
    final avatarSpace = isSender ? 0: avatarSize + insets.normal;

    final bubbleTextMaxWidth = MediaQuery.of(context).size.width / 1.5 - avatarSpace;

    final textStyle =  TextStyle(
      color: isSender? theme.primaryTextTheme.bodyText2?.color: null,
      fontSize: theme.textTheme.bodyText2?.fontSize,
      fontWeight: FontWeight.w400,
    );

    final text = data.message;

    var textWidth = TextWidgetUtils.textSizeOf(text, textStyle).width;
    if (textWidth > bubbleTextMaxWidth) {
      textWidth = bubbleTextMaxWidth;
    }

    var bubbleHorizontalPadding = insets.large;

    var smallRadius = insets.small;
    var largeRadius = insets.extraLarge;

    var borderRadius = isSender? BorderRadius.only(
      topRight: Radius.circular(isOldestMessage? largeRadius: smallRadius),
      bottomRight: Radius.circular(isNewestMessage? largeRadius : smallRadius),
      topLeft: Radius.circular(largeRadius),
      bottomLeft: Radius.circular(largeRadius),
    ): BorderRadius.only(
      topLeft: Radius.circular(isOldestMessage? largeRadius: smallRadius),
      bottomLeft: Radius.circular(isNewestMessage? largeRadius : smallRadius),
      topRight: Radius.circular(largeRadius),
      bottomRight: Radius.circular(largeRadius),
    );

    Widget bubble = Opacity(
      opacity: isSender && data.state != MessageState.verified ? 0.5: 1,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: insets.large, horizontal: bubbleHorizontalPadding),
        alignment: Alignment.center,
        //+ padding of container * 2
        width: textWidth + bubbleHorizontalPadding * 2,
        decoration: isSender? BoxDecoration(
          gradient: Themes.getGradientFrom(theme),
          borderRadius: borderRadius,
        ): BoxDecoration(
          color: theme.brightness == Brightness.light? Colors.grey.shade200 : Colors.grey.shade800,
          borderRadius: borderRadius,
        ),
        child: Text(
          text,
          textAlign: TextAlign.left,
          maxLines: null,
          style: textStyle,
        ),
      ),
    );

    if (data.state == MessageState.error) {
      bubble = GestureDetector(
        onLongPress: () async {
          var res = await showResendMessageDialog(context);
          if (res != null && res) {
            onErrorLongTap?.call(data);
          }
        },
        child: bubble,
      );
    }

    var rowChildren = [
      SizedBox(width: isSender? insets.extraLarge: insets.large),
      if (!isSender) Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          isPrivate? SizedBox(width: insets.large) :Padding(
            child: isNewestMessage? UserAvatar(
              radius: avatarSize / 2,
              avatar: data.sender.avatar,
            ): SizedBox(width: avatarSize,),
            padding: EdgeInsets.only(right: avatarPadding),
          )
        ],
      ),
      bubble,
      SizedBox(width: insets.large,),
      if (data.state == MessageState.verified) SizedBox(
        height: avatarSize,
        child: Text(
          MyDateUtils.timeToDisplayString(context, data.createdAt.toLocal()),
          style: theme.textTheme.caption,
        ),
      ),
      if (data.state == MessageState.error) SizedBox(
        height: avatarSize,
        child: Icon(
          Icons.error_outline,
          color: theme.errorColor,
        ),
      )
    ];

    if (isSender) {
      rowChildren = rowChildren.reversed.toList();
    }

    return Column(
      children: [
        if (data.isLastOfDay) ...[
          SizedBox(height: insets.extraLarge,),
          Text(
            MyDateUtils.toDisplayString2(context, data.createdAt),
            style: TextStyle(
              fontWeight: theme.textTheme.caption?.fontWeight,
              fontSize: theme.textTheme.bodyText1?.fontSize,
              color: theme.textTheme.caption?.color,
            ),
          ),
          SizedBox(height: insets.extraLarge,),
        ],
        if (isOldestMessage && !isSender && !isPrivate) Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: insets.normal, left: insets.large + avatarSize + avatarPadding + insets.large),
            child: Text(
              data.sender.displayName ?? data.sender.userName,
              style: theme.textTheme.caption,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: isNewestMessage? insets.extraLarge: insets.normal),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: isSender? MainAxisAlignment.end : MainAxisAlignment.start,
            children: rowChildren,
          ),
        )
      ],
    );
  }

  Future<bool?> showResendMessageDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: ThemeBaseGradientContainer(
            child: Text(l10n.resendMessageDialogTitle),
          ),
          content: Text(
            data.message,
            maxLines: 2,
            style: theme.textTheme.bodyText2,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              color: theme.errorColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.done),
              color: Colors.green,
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }
}





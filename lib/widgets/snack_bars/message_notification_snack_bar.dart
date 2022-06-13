import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/models/chat/response/chat_message_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_simplify_info_response.dart';
import 'package:connectgamermobile/widgets/containers/top_snack_bar_container.dart';
import 'package:connectgamermobile/widgets/images/user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../containers/gradient_container.dart';

class MessageNotificationSnackBar extends StatelessWidget with StatelessVariablesMixin {
  final ChatMessageResponse message;

  MessageNotificationSnackBar({Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TopSnackBarContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: insets.large),
            child: Text(
              message.roomInfo?.name ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.caption,
            ),
          ),
          SizedBox(height: insets.normal,),
          RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                children: [
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: insets.normal),
                        child: UserAvatar(
                          avatar: message.sender.avatar,
                          radius: 12,
                        ),
                      )
                  ),
                  TextSpan(
                    text: "${message.sender.displayName ?? message.sender.userName}: ",
                    style: theme.textTheme.bodyText1,
                  ),
                  TextSpan(
                    text: message.message,
                    style: theme.textTheme.bodyText2
                  )
                ]
            ),
          )
        ],
      ),
    );
  }
}
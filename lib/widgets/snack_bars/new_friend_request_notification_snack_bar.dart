import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/models/chat/response/chat_message_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_simplify_info_response.dart';
import 'package:connectgamermobile/models/friend/response/friend_request_response_minimize.dart';
import 'package:connectgamermobile/widgets/containers/top_snack_bar_container.dart';
import 'package:connectgamermobile/widgets/images/user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../containers/gradient_container.dart';

class NewFriendRequestNotificationSnackBar extends StatelessWidget with StatelessVariablesMixin {
  final FriendRequestResponseMinimize data;

  NewFriendRequestNotificationSnackBar({Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TopSnackBarContainer(
      child: RichText(
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            children: [
              WidgetSpan(
                  child: Padding(
                    child: Icon(Icons.add_alert, color: Colors.red,),
                    padding: EdgeInsets.only(right: insets.extraLarge),
                  ),
                  alignment: PlaceholderAlignment.middle
              ),
              WidgetSpan(
                  child: Padding(
                    child: UserAvatar(
                      radius: 12,
                      avatar: data.requester.avatar,
                    ),
                    padding: EdgeInsets.only(right: insets.normal),
                  ),
                  alignment: PlaceholderAlignment.middle
              ),
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: ThemeBaseGradientContainer(
                    child: Text(data.requester.displayName ?? data.requester.userName, style: theme.textTheme.bodyText1,),
                  )
              ),
              TextSpan(
                  text: " ${l10n.friendRequestReceivedMessage}",
                  style: theme.textTheme.bodyText2
              )
            ]
        ),
      ),
    );
  }
}
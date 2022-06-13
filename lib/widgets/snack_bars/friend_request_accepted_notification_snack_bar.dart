import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/models/chat/response/chat_message_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_simplify_info_response.dart';
import 'package:connectgamermobile/models/friend/response/friend_request_response_minimize.dart';
import 'package:connectgamermobile/widgets/containers/top_snack_bar_container.dart';
import 'package:connectgamermobile/widgets/images/user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../containers/gradient_container.dart';

class FriendRequestAcceptedNotificationSnackBar extends StatelessWidget with StatelessVariablesMixin {
  final FriendRequestResponseMinimize data;

  FriendRequestAcceptedNotificationSnackBar({Key? key,
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
                    child: Icon(Icons.person_add_alt_1, color: Colors.green,),
                    padding: EdgeInsets.only(right: insets.extraLarge),
                  ),
                  alignment: PlaceholderAlignment.middle
              ),
              WidgetSpan(
                  child: Padding(
                    child: UserAvatar(
                      radius: 12,
                      avatar: data.receiver.avatar,
                    ),
                    padding: EdgeInsets.only(right: insets.normal),
                  ),
                  alignment: PlaceholderAlignment.middle
              ),
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: ThemeBaseGradientContainer(
                    child: Text(data.receiver.displayName ?? data.receiver.userName, style: theme.textTheme.bodyText1,),
                  )
              ),
              TextSpan(
                  text: " ${l10n.friendRequestAcceptedMessage}",
                  style: theme.textTheme.bodyText2
              )
            ]
        ),
      ),
    );
  }
}
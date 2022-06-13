import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_full_info_response.dart';
import 'package:connectgamermobile/widgets/containers/top_snack_bar_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../containers/gradient_container.dart';
import '../groups/chat_room_identifier.dart';

class NewRoomNotificationSnackBar extends StatelessWidget with StatelessVariablesMixin {
  ChatRoomFullInfoResponse roomInfo;
  NewRoomNotificationSnackBar({Key? key,
    required this.roomInfo,
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
                    child: Icon(Icons.add_circle_outline, color: Colors.green,),
                    padding: EdgeInsets.only(right: insets.extraLarge),
                  ),
                  alignment: PlaceholderAlignment.middle
              ),
              WidgetSpan(
                  child: Padding(
                    child: ChatRoomAvatar(
                      data: roomInfo,
                      avatarSize: 24,
                    ),
                    padding: EdgeInsets.only(right: insets.normal),
                  ),
                  alignment: PlaceholderAlignment.middle
              ),
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: ThemeBaseGradientContainer(
                    child: Text(roomInfo.name, style: theme.textTheme.bodyText1,),
                  )
              ),
              TextSpan(
                text: " ${l10n.addChatRoomSuccess}",
                style: theme.textTheme.bodyText2
              )
            ]
        ),
      ),
    );
  }
}
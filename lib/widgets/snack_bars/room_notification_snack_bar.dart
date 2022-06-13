import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_full_info_response.dart';
import 'package:connectgamermobile/widgets/containers/top_snack_bar_container.dart';
import 'package:connectgamermobile/widgets/groups/chat_room_identifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/user/user_minimized_info.dart';
import '../containers/gradient_container.dart';

class UsersAddedNotificationSnackBar extends StatelessWidget with StatelessVariablesMixin {

  ChatRoomFullInfoResponse roomInfo;
  List<UserMinimizedInfo> users;

  UsersAddedNotificationSnackBar({Key? key,
    required this.roomInfo,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _RoomNotificationSnackBar(
      icon: Icon(Icons.add_circle_outline, color: Colors.green,),
      roomInfo: roomInfo,
      message: "${l10n.newUsersInChatRoomMessage}: ${users.map((e) => e.userName).join(", ")}",
    );
  }
}

class UsersRemovedNotificationSnackBar extends StatelessWidget with StatelessVariablesMixin {

  ChatRoomFullInfoResponse roomInfo;
  List<UserMinimizedInfo> users;

  UsersRemovedNotificationSnackBar({Key? key,
    required this.roomInfo,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _RoomNotificationSnackBar(
      icon: Icon(Icons.remove_circle_outline, color: Colors.red,),
      roomInfo: roomInfo,
      message: "${l10n.removeUsersFromChatRoomMessage}: ${users.map((e) => e.userName).join(", ")}",
    );
  }
}

class AddedToChatRoomNotificationSnackBar extends StatelessWidget with StatelessVariablesMixin {

  ChatRoomFullInfoResponse roomInfo;

  AddedToChatRoomNotificationSnackBar({Key? key,
    required this.roomInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _RoomNotificationSnackBar(
      icon: Icon(Icons.add_circle_outline, color: Colors.green,),
      roomInfo: roomInfo,
      message: "${l10n.addedToChatRoom}",
    );
  }
}

class RemovedFromChatRoomNotificationSnackBar extends StatelessWidget with StatelessVariablesMixin {

  ChatRoomFullInfoResponse roomInfo;

  RemovedFromChatRoomNotificationSnackBar({Key? key,
    required this.roomInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _RoomNotificationSnackBar(
      icon: Icon(Icons.remove_circle_outline, color: Colors.red,),
      roomInfo: roomInfo,
      message: "${l10n.kickedFromRoomMessage}",
    );
  }
}


class _RoomNotificationSnackBar extends StatelessWidget with StatelessVariablesMixin {
  final ChatRoomFullInfoResponse roomInfo;
  final String message;
  final Widget? icon;
  _RoomNotificationSnackBar({Key? key,
    required this.roomInfo,
    required this.message,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TopSnackBarContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                children: [
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
                ]
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                children: [
                  if (icon != null) WidgetSpan(
                      child: Padding(
                        child: icon,
                        padding: EdgeInsets.only(right: insets.extraLarge),
                      ),
                      alignment: PlaceholderAlignment.middle
                  ),
                  TextSpan(
                    text: message,
                    style: theme.textTheme.bodyText2,
                  ),
                ]
            ),
          ),
          SizedBox(height: insets.normal,),
        ],
      ),
    );
  }
}
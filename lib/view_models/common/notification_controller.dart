import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:connectgamermobile/data/repositories/chat_repository.dart';
import 'package:connectgamermobile/data/repositories/friend_repository.dart';
import 'package:connectgamermobile/models/chat/response/chat_message_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_full_info_response.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_simplify_info_response.dart';
import 'package:connectgamermobile/models/friend/response/friend_request_response_minimize.dart';
import 'package:connectgamermobile/widgets/snack_bars/friend_request_accepted_notification_snack_bar.dart';
import 'package:connectgamermobile/widgets/snack_bars/message_notification_snack_bar.dart';
import 'package:connectgamermobile/widgets/snack_bars/new_friend_request_notification_snack_bar.dart';
import 'package:connectgamermobile/widgets/snack_bars/new_room_notification_snack_bar.dart';
import 'package:connectgamermobile/widgets/snack_bars/room_info_notification_snack_bar.dart';
import 'package:connectgamermobile/widgets/snack_bars/room_notification_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../models/user/user_minimized_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


///Handle showing notification from view models
class NotificationController {

  //chat channel
  static String chatChannelGroupKey = "connect_gamers_channel_chat";
  static String chatChannelGroupName = "Chat";

  static String messageChannelKey = "connect_gamers_channel_message";
  static String messageChannelName = "Messages";
  static String messageChannelDescription = "Notifications on receiving message";

  static String chatRoomChannelKey = "connect_gamers_channel_chat_room";
  static String chatRoomChannelName = "Chat rooms";
  static String chatRoomChannelDescription = "Notification on actions on chat room";

  static String otherChannelGroupKey = "connect_gamers_channel_others";
  static String otherChannelGroupName = "Others";

  static String friendRequestChannelKey = "connect_gamers_channel_friend_request";
  static String friendRequestChannelName = "Friend requests";
  static String friendRequestChannelDescription = "Notification on friend requests";

  //create, add chat room channel
  NotificationController._internal();

  factory NotificationController() {
    return _instance;
  }

  static final NotificationController _instance = NotificationController._internal();

  Future<void> init() async {
    //init shared preferences
    await AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
              channelGroupKey: chatChannelGroupKey,
              channelKey: messageChannelKey,
              channelName: messageChannelName,
              channelDescription: messageChannelDescription,
              defaultColor: Color(0xFF9D50DD),
              ledColor: Colors.white),
          NotificationChannel(
              channelGroupKey: chatChannelGroupKey,
              channelKey: chatRoomChannelKey,
              channelName: chatRoomChannelName,
              channelDescription: chatRoomChannelDescription,
              defaultColor: Color(0xFF9D50DD),
              ledColor: Colors.white),
          NotificationChannel(
              channelGroupKey: otherChannelGroupKey,
              channelKey: friendRequestChannelKey,
              channelName: friendRequestChannelName,
              channelDescription: friendRequestChannelDescription,
              defaultColor: Color(0xFF9D50DD),
              ledColor: Colors.white),
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupkey: chatChannelGroupKey,
              channelGroupName: chatChannelGroupName),
          NotificationChannelGroup(
              channelGroupkey: otherChannelGroupKey,
              channelGroupName: otherChannelGroupName)
        ],
        debug: true
    );
  }

  void onNewRoom(BuildContext context, ChatRoomFullInfoResponse roomInfo) {
    showInAppNotification(context, NewRoomNotificationSnackBar(roomInfo: roomInfo));
    // final l10n = getL10n(context);
    // AwesomeNotifications().createNotification(
    //     content: NotificationContent(
    //       id: roomInfo.id.hashCode,
    //       channelKey: chatRoomChannelKey,
    //       notificationLayout: NotificationLayout.Default,
    //       title: l10n.newChatRoomNotificationTitle,
    //       body: roomInfo.name,
    //       category: NotificationCategory.Social
    //     )
    // );
  }

  void onRoomInfoChanged(BuildContext context, ChatRoomSimplifyInfoResponse roomInfo) {
    showInAppNotification(context, RoomInfoNotificationSnackBar(info: roomInfo,));
  }

  void onUsersAddedToChatRoom(BuildContext context, ChatRoomFullInfoResponse roomInfo, List<UserMinimizedInfo> users) {
    showInAppNotification(context, UsersAddedNotificationSnackBar(roomInfo: roomInfo, users: users));
  }

  void onUsersRemovedFromChatRoom(BuildContext context, ChatRoomFullInfoResponse roomInfo, List<UserMinimizedInfo> users) {
    showInAppNotification(context, UsersRemovedNotificationSnackBar(roomInfo: roomInfo, users: users));
  }

  void onAddedToChatRoom(BuildContext context, ChatRoomFullInfoResponse roomInfo) {
    showInAppNotification(context,  AddedToChatRoomNotificationSnackBar(roomInfo: roomInfo));
  }

  void onRemovedFromChatRoom(BuildContext context, ChatRoomFullInfoResponse roomInfo) {
    showInAppNotification(context, RemovedFromChatRoomNotificationSnackBar(roomInfo: roomInfo));
  }

  void onNewMessage(BuildContext context, ChatMessageResponse message) {
    showInAppNotification(context, MessageNotificationSnackBar(message: message));
  }

  void onNewFriendRequest(BuildContext context, FriendRequestResponseMinimize response) {
    showInAppNotification(context, NewFriendRequestNotificationSnackBar(data: response));
  }

  void onFriendRequestAccepted(BuildContext context, FriendRequestResponseMinimize response) {
    showInAppNotification(context, FriendRequestAcceptedNotificationSnackBar(data: response));
  }

  void _playSound() {
    FlutterRingtonePlayer.playNotification();
  }

  void showInAppNotification(BuildContext context, Widget content) {
    showTopSnackBar(context, content);
    _playSound();
  }

  AppLocalizations getL10n(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}

import 'package:connectgamermobile/models/chat/response/chat_room_full_info_response.dart';
import 'package:connectgamermobile/resources/enums.dart';
import 'package:connectgamermobile/resources/routes.dart';
import 'package:connectgamermobile/ui/chat/select_friend_page.dart';
import 'package:connectgamermobile/ui/chat/room/chat_room_member_page.dart';
import 'package:connectgamermobile/ui/friend/friend_request_page.dart';
import 'package:connectgamermobile/ui/games/fortnite/fortnite_detail.dart';
import 'package:connectgamermobile/view_models/chat/select_friend_view_model.dart';
import 'package:connectgamermobile/view_models/chat/chat_home_page_view_model.dart';
import 'package:connectgamermobile/view_models/chat/chat_room_view_models.dart';
import 'package:connectgamermobile/view_models/common/notification_controller.dart';
import 'package:connectgamermobile/view_models/friend/friend_home_view_model.dart';
import 'package:connectgamermobile/view_models/friend/friend_request_view_model.dart';
import 'package:connectgamermobile/view_models/game/fortnite_view_model.dart';
import 'package:connectgamermobile/view_models/search_view_model.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/strings.dart';
import '../../ui/chat/room/chat_room_info_page.dart';
import '../../ui/chat/room/chat_room_page.dart';
import '../../ui/games/pubg/pubg_details.dart';
import '../../ui/home/homepage.dart';
import 'package:connectgamermobile/ui/games/apex/apex_details.dart';
import 'package:connectgamermobile/view_models/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ui/search/search_page.dart';
import '../../view_models/game/apex_view_model.dart';
import '../../view_models/game/pubg_view_model.dart';

class NavigatorExtension {

  NavigatorExtension._internal();

  static void navigateToAccountPage(BuildContext context) {
    Navigator.pushNamed(context, Routes.accountPage);
  }

  static void toSearchChatPage(BuildContext context) {
    Navigator.pushNamed(context, Routes.searchChat);
  }

  static void searchWithFilter(BuildContext context, SupportedGame game) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => SearchViewModel(),
          child: SearchPage(game: game),
        ))
    );
  }

  static Future<T?> toAddChatRoomPage<T>(BuildContext context) {
    return Navigator.push<T>(context, MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => SelectFriendViewModel(),
          child: const SelectFriendPage(),
        ))
    );
  }

  static void toHomePage(BuildContext context, String userName, {int index = 0, String name=""}) {

    MaterialPageRoute page;

    page = MaterialPageRoute(builder: (context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FriendHomeViewModel(context)),
          ChangeNotifierProvider(create: (context) => ChatHomePageViewModel(context, userName)),
        ],
        child: HomePage(startPageIndex: Routes.bottomNav.contains(name) ? Routes.bottomNav.indexOf(name): index),
      );
    });

    //make sure home page always the first page;
    Navigator.pushAndRemoveUntil(context, page, (Route<dynamic> route) => false);
  }

  static Future<void> toChatRoom(BuildContext context, ValueNotifier<ChatRoomFullInfoResponse> data) async {
    await Navigator.push(context, MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => ChatRoomViewModel(data, Strings.testUsername, context),
          child: const ChatRoomPage(),
        ))
    );
  }

  static Future<ChatRoomFullInfoResponse?> openChatRoomInfo(BuildContext context, ChatRoomViewModel viewModel) async {
    return await Navigator.push<ChatRoomFullInfoResponse>(context, MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider.value(
          value: viewModel,
          child: const ChatRoomInfoPage(),
        ))
    );
  }

  static void toChatRoomMemberPage(BuildContext context, ChatRoomViewModel viewModel) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider.value(
          value: viewModel,
          child: const ChatRoomMemberPage(),
        ))
    );
  }

  static Future<List<String>?> toAddNewFriendToChatRoom(BuildContext context,[List<String> excludedUserNames = const []]) {
    return Navigator.push<List<String>>(context, MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => SelectFriendViewModel(excludedUserNames),
          child: const SelectFriendPage(overrideActionIcon: Icon(Icons.done),),
        ))
    );
  }

  static void backToHome(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }
  static void toApexDetailPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => ApexViewModel(),
          child: const ApexLegendsPage(),
        ))
    );
  }

  static Future<void> toFriendRequestPage(BuildContext context) async {
    await Navigator.push(context, MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (_) => FriendRequestViewModel(),
          child: const FriendRequestPage(),
        ))
    );
  }

  static void toPUBGDetailPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => PUBGViewModel(),
          child: const PUBGPage(),
        ))
    );
  }

  static void toFortniteDetailPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => FortniteViewModel(),
          child: const FortnitePage(),
        ))
    );
  }
}
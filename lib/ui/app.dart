import 'package:connectgamermobile/resources/routes.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/resources/themes.dart';
import 'package:connectgamermobile/ui/account/account_standalone_page.dart';
import 'package:connectgamermobile/ui/account/games/link_game_accounts_page.dart';
import 'package:connectgamermobile/ui/account/notifications/notification_page.dart';
import 'package:connectgamermobile/ui/account/settings/setting_page.dart';
import 'package:connectgamermobile/ui/chat/search_chat_page.dart';
import 'package:connectgamermobile/ui/home/homepage.dart';
import 'package:connectgamermobile/ui/post/create_post_page.dart';
import 'package:connectgamermobile/ui/search/search_username_page.dart';
import 'package:connectgamermobile/ui/authentication/signup.dart';
import 'package:connectgamermobile/ui/splash/splash.dart';
import 'package:connectgamermobile/view_models/common/notification_controller.dart';
import 'package:connectgamermobile/view_models/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat/room/chat_room_page.dart';
import 'authentication/login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'games/apex/apex_details.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey();

  static GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: messengerKey,
      navigatorKey: navigatorKey,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      title: Strings.appName,
      theme: Themes.getThemeOf(Provider.of<ThemeViewModel>(context).currentThemeName),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        Routes.login: (context) => const LoginPage(),
        Routes.signUp: (context) => const SignUpPage(),

        Routes.searchUsername: (_) => const SearchUsernamePage(),

        Routes.createPost: (_) => const CreatePostPage(),

        Routes.settings: (_) => const SettingPage(),

        Routes.linkGames: (_) => const LinkGameAccountsPage(),

        Routes.accountPage: (_) => const AccountStandalonePage(),

        Routes.notifications: (_) => const NotificationPage(),

        Routes.searchChat: (_) => const SearchChatPage(),
      },
      onGenerateRoute: (setting) {
        var name = setting.name;
        
        if (Routes.bottomNav.contains(name)) {
          return MaterialPageRoute(builder: (context) {
            return HomePage(startPageIndex: Routes.bottomNav.indexOf(name!));
          });
        }
        return null;
      },
    );
  }
}
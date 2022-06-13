import 'dart:async';

import 'package:connectgamermobile/ui/account/account_home_page.dart';
import 'package:connectgamermobile/ui/chat/chat_home_page.dart';
import 'package:connectgamermobile/ui/friend/friend_home_page.dart';
import 'package:connectgamermobile/ui/post/posts_home_page.dart';
import 'package:connectgamermobile/ui/search/search_home_page.dart';
import 'package:connectgamermobile/ui/home/custom_nav_field.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {

  final int startPageIndex;

  const HomePage({Key? key,
    this.startPageIndex = 0,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  final PageController _pageController = PageController();

  int _currentPageIndex = 0;

  late Widget firstPage = const PostsHomePage();
  late Widget secondPage = const ChatHomePage();
  late Widget thirdPage = SearchHomePage();
  late Widget fourthPage = const FriendHomePage();
  late Widget fifthPage = const AccountHomePage();

  final StreamController<int> _navFieldIndexStreamController = StreamController<int>();

  late final NavigatorField bottomNavView = NavigatorField(
    startIndex: _currentPageIndex,
    indexStream: _navFieldIndexStreamController.stream,
    onIndexChanged: (index) {
      _pageController.jumpToPage(index);
      setState(() {
        _currentPageIndex = index;
      });
    },
  );

  @override
  void initState() {
    _currentPageIndex = widget.startPageIndex;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _navFieldIndexStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: _getCurrentAppBar(context, _currentPageIndex),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          _navFieldIndexStreamController.add(index);
          setState(() {
            _currentPageIndex = index;
          });
        },
        itemCount: bottomNavView.itemCount,
        itemBuilder: (context, index) {
          return SafeArea(child: _getCurrentFragment(index));
        },
      ),
      bottomNavigationBar: bottomNavView,
    );
  }

  Widget _getCurrentFragment(int index) {
    switch(index) {
      case 0: {
        return firstPage;
      }
      case 1: {
        return secondPage;
      }
      case 2: {
        return thirdPage;
      }
      case 3: {
        return fourthPage;
      }
      case 4: {
        return fifthPage;
      }
      default: {
        return secondPage;
      }
    }
  }
  
  PreferredSizeWidget? _getCurrentAppBar(BuildContext context, int index) {
    switch(index) {
      case 0: {
        return null;
      }
      case 1: {
        return null;
      }
      case 2: {
        return null;
      }
      case 3: {
        return null;
        // return TextFieldGradientAppBar(
        //   hintText: "Search...",
        //   data: GradientAppBarData(
        //     actions: [
        //       IconButton(
        //         splashRadius: 24,
        //         icon: Icon(Icons.person_add_alt_1),
        //         onPressed: () => Navigator.pushNamed(context, Routes.searchUsername),
        //       )
        //     ]
        //   )
        // ).build(context);
      }
      case 4: {
        return null;
      }
      default: {
        return null;
      }
    }
  }
}
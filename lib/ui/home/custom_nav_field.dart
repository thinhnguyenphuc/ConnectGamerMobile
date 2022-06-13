import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/themes.dart';
import 'package:connectgamermobile/view_models/friend/friend_request_view_model.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class NavigatorField extends StatefulWidget {
  int startIndex;

  final int itemCount = 5;

  ///used to change nav field current index from outside
  late final Stream<int>? indexStream;

  void Function(int) onIndexChanged;

  NavigatorField({Key? key,
    required this.startIndex,
    this.indexStream,
    required this.onIndexChanged,
  }) :super(key: key) {
    if (startIndex >= itemCount || startIndex < 0) {
      startIndex = 0;
    }
  }

  @override
  _NavigatorFieldState createState() => _NavigatorFieldState();
}

class _NavigatorFieldState extends State<NavigatorField> with StateVariablesMixin {

  late int _currentIndex = widget.startIndex;

  int test = 1;

  void setIndex(int index) {
    if (index >= 0 && index < widget.itemCount && index != _currentIndex) {
      setState(() {
        _currentIndex = index;
        widget.onIndexChanged(index);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    widget.indexStream?.listen((index) {
      setIndex(index);
    });

  }

  @override
  void dispose() {

    super.dispose();
  }

  void onFriendRequestCountChanged() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade400,
          )
        ),
      ),
      child: CustomNavigationBar(
        iconSize: 30.0,
        backgroundColor: theme.bottomNavigationBarTheme.backgroundColor!,
        elevation: 20,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.assignment_outlined),
            selectedIcon: _createSelectedIcon(theme, Icons.assignment_outlined),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.chat),
            selectedIcon: _createSelectedIcon(theme, Icons.chat),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.search),
            selectedIcon: _createSelectedIcon(theme, Icons.search),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.supervisor_account_rounded),
            selectedIcon: _createSelectedIcon(theme, Icons.supervisor_account_rounded),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.person),
            selectedIcon: _createSelectedIcon(theme, Icons.person),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setIndex(index);
        },
      ),
    );
  }

  Widget _createSelectedIcon(ThemeData theme, IconData iconData) {
    return GradientContainer(
      gradient: Themes.getGradientFrom(theme),
      child: Icon(iconData),
    );
  }
}



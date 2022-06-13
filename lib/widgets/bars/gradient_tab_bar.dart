import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/themes.dart';
import 'package:flutter/material.dart';

class GradientTabBar extends StatelessWidget {
 final GradientTabBarData data;

  const GradientTabBar({Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientTabBarBuilder(
        context: context,
        data: data
    ).build(context);
  }
}

class GradientTabBarData{
  final List<String> tabsName;
  final EdgeInsets? tabPadding;
  final Color? backgroundColor;

  const GradientTabBarData({
    required this.tabsName,
    this.tabPadding,
    this.backgroundColor,
  });
}

///Use this if you want to return a [TabBar].
///If that isn't the case, please use [GradientTabBar] instead
class GradientTabBarBuilder with WidgetBuilderVariableMixin{
  final BuildContext context;
  final GradientTabBarData data;

  GradientTabBarBuilder({Key? key,
    required this.context,
    required this.data,
  });

  TabBar build(BuildContext context) {
    initVariables(context);

    return TabBar(
      labelPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
      indicator: BoxDecoration(
        gradient: Themes.getGradientFrom(theme),
      ),
      tabs: data.tabsName.map((tabName) => Tab(
        child: Container(
          padding: data.tabPadding,
          alignment: Alignment.center,
          color: data.backgroundColor ?? theme.scaffoldBackgroundColor,
          child: Text(
            tabName,
          ),
        ),
      )).toList(),
    );
  }
}

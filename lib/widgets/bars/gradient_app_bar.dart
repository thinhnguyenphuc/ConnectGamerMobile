import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/themes.dart';
import 'package:connectgamermobile/utils/color.dart';
import 'package:flutter/material.dart';

class GradientAppBarData {
  Widget? title;
  bool centerTitle;
  List<Widget>? actions;
  Widget? leading;
  bool noLeading;
  double? titleSpacing;
  double? elevation;
  bool actionIsGradient;

  GradientAppBarData({
    this.title,
    this.centerTitle = false,
    this.actions,
    this.leading,
    this.noLeading = false,
    this.titleSpacing,
    this.elevation,
    this.actionIsGradient = true,
  });
}

///Gradient variant of AppBar, which means gradient is applied to icons and texts
class GradientAppBar with WidgetBuilderVariableMixin {
  final GradientAppBarData data;

  final bool titleIsGradient;

  ///Remember to call build(context)
  GradientAppBar({
    required this.data,
    this.titleIsGradient = true,
  });

  PreferredSizeWidget build(BuildContext context) {
    initVariables(context);

    final gradient = Themes.getGradientFrom(theme);

    return PreferredSize(
      child: AppBar(
        elevation: data.elevation,
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: data.noLeading? null: (data.leading ?? (Navigator.canPop(context)? GradientUtils.paintWidget(context, const BackButton(), gradient): null)),
        leadingWidth: data.noLeading? 0: 56.0,
        title: titleIsGradient? GradientUtils.paintWidget(context, data.title, gradient): data.title,
        actions: data.actionIsGradient? GradientUtils.paintWidgetList(context, data.actions, gradient): data.actions,
        centerTitle: data.centerTitle,
        titleSpacing: data.titleSpacing,
      ),
      preferredSize: AppBar().preferredSize,
    );
  }
}

///Gradient variant of AppBar, the background color is a gradient
class GradientBackgroundAppBar {
  final GradientAppBarData data;

  ///Remember to call build(context)
  const GradientBackgroundAppBar({
    required this.data,
  });

  PreferredSizeWidget build(BuildContext context) {
    final gradient = Themes.getGradientFrom(Theme.of(context));

    return PreferredSize(
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          title: data.title,
          actions: data.actions,
          centerTitle: data.centerTitle,
        ),
      ),
      preferredSize: AppBar().preferredSize,
    );
  }

}

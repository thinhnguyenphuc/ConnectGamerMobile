
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:flutter/material.dart';

class SettingList extends StatelessWidget with StatelessVariablesMixin {

  final double sectionSpace;

  final List<SettingSection> sections;

  final EdgeInsets? padding;

  SettingList({Key? key,
    this.sectionSpace = 10,
    required this.sections,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Ink(
      padding: padding ?? EdgeInsets.symmetric(vertical: insets.large, horizontal: insets.extraLarge),
      color: Theme.of(context).backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: _generateChildren(context),
        ),
      ),
    );
  }

  List<Widget> _generateChildren(BuildContext context) {
    return List.generate(sections.length, (index) {
      if (index > 0) {
        return Padding(
          padding: EdgeInsets.only(top: insets.extraLarge),
          child: sections[index],
        );
      } else {
        return sections[index];
      }
    });
  }
}

class SettingSection extends StatelessWidget with StatelessVariablesMixin {

  final String? title;

  final List<SettingTile> tiles;

  SettingSection({Key? key,
    this.title,
    required this.tiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Padding(
          padding: EdgeInsets.fromLTRB(insets.extraLarge, 0, 0, insets.large),
          child: Text(
            title!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(insets.large),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _createTiles(context),
          ),
        )
      ],
    );
  }

  List<Widget> _createTiles(BuildContext context) {
    return List.generate(tiles.length*2 - 1, (index) {
      if (index.isEven) {
        return tiles[index~/2];
      } else {
        return Divider(
          color: Colors.grey.shade300,
          thickness: 1,
          height: 1,
        );
      }
    });
  }

}

class SettingTile extends StatelessWidget with StatelessVariablesMixin {
  final Widget title;
  final Icon? icon;
  final Widget? currentValue;
  final void Function()? onPressed;

  SettingTile({Key? key,
    required this.title,
    this.icon,
    this.currentValue,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final List<Widget> leftChildren = [];
    final List<Widget> rightChildren = [];

    if (icon != null) {
      leftChildren.add(icon!);
      leftChildren.add(SizedBox(width: insets.large,));
    }
    leftChildren.add(title);

    if (currentValue != null) {
      rightChildren.add(currentValue!);
    }

    return InkWell(
      splashFactory: InkRipple.splashFactory,
      onTap: onPressed,
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: insets.large, vertical: insets.large),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: leftChildren,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: rightChildren,
            ),
          ],
        ),
      ),
    );
  }

}
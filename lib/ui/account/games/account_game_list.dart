import 'package:connectgamermobile/custom_classes/extensions/navigator_extension.dart';
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/nums.dart';
import 'package:connectgamermobile/resources/routes.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/resources/themes.dart';

import 'package:connectgamermobile/view_models/account_game_list_view_model.dart';
import 'package:connectgamermobile/widgets/buttons/icon_text_button.dart';

import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:flutter/material.dart';

class AccountGameList extends StatelessWidget {

  final EdgeInsets? padding;

  const AccountGameList({Key? key,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding,
      itemCount: Strings.supportGameNames.length + 1,
      itemBuilder: (context, index) {
        if (index == Strings.supportGameNames.length) {
          return LinkedAnotherGameButton();
        } else {
          return GameItemButton(
            demoIndex: index,
            ign: "SKT Faker",
            onPressed: () {
              AccountGameListViewModel.navigateToGamePage(context, index);
            },
            onIconPressed: () {},
            icon: const Icon(Icons.change_circle_outlined),
          );
        }
      },
    );
  }

}

class GameItemButton extends StatelessWidget with StatelessVariablesMixin {

  final int demoIndex;
  final String? ign;
  final void Function()? onPressed;
  final void Function()? onIconPressed;
  final Widget? icon;
  final EdgeInsets? margin;
  final Color? backgroundColor;

  GameItemButton({Key? key,
    required this.demoIndex,
    this.ign,
    this.onPressed,
    this.onIconPressed,
    this.icon,
    this.margin,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: margin ?? EdgeInsets.only(bottom: insets.large),
      child: InkWell(
        onTap: onPressed,
        splashFactory: InkRipple.splashFactory,
        child: Ink(
          padding: EdgeInsets.fromLTRB(insets.extraLarge, insets.large, insets.normal, insets.large),
          color: backgroundColor ?? Theme.of(context).cardColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    foregroundImage: AssetImage(Strings.supportGameIconsPath[demoIndex]),
                  ),
                  SizedBox(width: Insets.of(context).large,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.supportGameNames[demoIndex],
                        style: theme.textTheme.bodyText1,
                      ),
                      if (ign != null) SizedBox(height: insets.normal,),
                      if (ign != null) Text(
                        "IGN: $ign",
                        style: theme.textTheme.bodyText2,
                      )
                    ],
                  )
                ],
              ),
              if (icon != null) GradientContainer(
                  child: IconButton(
                    icon: icon!,
                    iconSize: 32,
                    splashRadius: 24,
                    onPressed: onIconPressed,
                  ),
                  gradient: Themes.getGradientFrom(theme)
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LinkedAnotherGameButton extends StatelessWidget with StatelessVariablesMixin {
  LinkedAnotherGameButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    const size = 48.0;

    return Padding(
      padding: EdgeInsets.all(insets.extraLarge),
      child: Align(
        alignment: Alignment.center,
        child: Ink(
          height: size,
          width: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: Themes.getGradientFrom(theme),
          ),
          child: IconButton(
            iconSize: size/2,
            splashRadius: size/2,
            onPressed: () {
              Navigator.pushNamed(context, Routes.linkGames);
            },
            icon: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

}
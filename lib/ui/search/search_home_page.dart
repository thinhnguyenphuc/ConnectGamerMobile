import 'package:connectgamermobile/custom_classes/extensions/navigator_extension.dart';
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/nums.dart';
import 'package:connectgamermobile/resources/routes.dart';
import 'package:connectgamermobile/utils/games.dart';
import 'package:connectgamermobile/widgets/buttons/text_field_button.dart';
import 'package:flutter/material.dart';

import '../../resources/enums.dart';

class SearchHomePage extends StatelessWidget with StatelessVariablesMixin {
  SearchHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: insets.large, horizontal: insets.extraLarge),
          child: TextFieldButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.searchUsername);
            },
            prefixIcon: const Icon(Icons.search),
            hintText: l10n.searchUsernameBtnText,
          ),
        ),
        SizedBox(height: insets.large),
        Expanded(
          child: _GameIconGridView(),
        ),
      ],
    );
  }
}

class _GameIconGridView extends StatelessWidget {

  final List<String> game = [];

  _GameIconGridView({Key? key,

  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: Insets.of(context).extraLarge,
      mainAxisSpacing: Insets.of(context).normal,
      crossAxisCount: 3,
      children: createIcons(context),
    );
  }

  List<Widget> createIcons(BuildContext context) {
    var i = 0;
    return <Widget>[
      for (var game in SupportedGame.values) Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            NavigatorExtension.searchWithFilter(context, game);
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4, 4),
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    GameUtils.getIconPathOf(game),
                    height: 64,
                    width: 64,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: Insets.of(context).small),
              Text(
                GameUtils.getDisplayNameOf(game),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    ];
  }

}
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/themes.dart';
import 'package:connectgamermobile/view_models/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeChoosingDialog extends StatefulWidget {
  const ThemeChoosingDialog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ThemeChoosingDialogState();
}

class _ThemeChoosingDialogState extends State<ThemeChoosingDialog> with StateVariablesMixin{

  late List<ThemeName> _themesName;

  @override
  void initState() {
    _themesName = Provider.of<ThemeViewModel>(context, listen: false).getThemeNames();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SimpleDialog(
      title: Text(l10n.chooseThemeTitle),
      children: [
        Padding(
          padding: EdgeInsets.all(insets.extraLarge),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: insets.large,
            runSpacing: insets.large,
            children: _createList(context),
          ),
        )
      ],
    );
  }

  List<Widget> _createList(BuildContext context) {
    List<Widget> list = [];
    var _currentThemeName = Provider.of<ThemeViewModel>(context).currentThemeName;

    for (var themeName in _themesName) {
      if (themeName == _currentThemeName) {
        list.add(ThemeItem(
          isChosen: true,
          themeName: themeName,
        ));
      } else {
        list.add(ThemeItem(
          isChosen: false,
          themeName: themeName,
        ));
      }
    }

    return list;
  }

}

class ThemeItem extends StatelessWidget {
  final ThemeName themeName;
  final bool isChosen;
  final double size;
  final double chosenBorderWith;
  final double backgroundColorSize;
  const ThemeItem({Key? key,
    required this.themeName,
    this.isChosen = false,
    this.size = 62,
    this.chosenBorderWith = 3,
    this.backgroundColorSize = 24,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Themes.getThemeOf(themeName);

    var size2 = size - backgroundColorSize - chosenBorderWith;

    var borderRadius = 100.0;

    return GestureDetector(
      onTap: () {
        Provider.of<ThemeViewModel>(context, listen: false).setNewTheme(themeName);
      },
      child: Container(
        alignment: Alignment.center,
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: isChosen? Colors.green: Colors.grey,
              width: chosenBorderWith
          ),
          color: theme.scaffoldBackgroundColor,
        ),
        child: Container(
          height: size2,
          width: size2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: Themes.getGradientFrom(theme),
          ),
        ),
      ),
    );
  }

}
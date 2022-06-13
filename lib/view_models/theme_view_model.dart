import 'package:connectgamermobile/resources/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeViewModel extends ChangeNotifier {
  
  static const String sp_key = "current_theme";

  ThemeName currentThemeName;

  ThemeViewModel._({required this.currentThemeName
  });

  static Future<ThemeViewModel> init() async {

    final sp = await SharedPreferences.getInstance();
    var themeName = sp.getString(sp_key);

    if (themeName == null || themeName.isEmpty) {
      themeName = ThemeName.light.toString();
      await sp.setString(sp_key, themeName);
    }

    return ThemeViewModel._(
        currentThemeName: ThemeName.values.firstWhere((e) => e.toString() == themeName)
    );
  }

  List<ThemeName> getThemeNames() {
    return ThemeName.values.toList();
  }

  ThemeData getThemeDataFrom(ThemeName name) {
    return Themes.getThemeOf(name);
  }

  void setNewTheme(ThemeName name) async {
    if (name == currentThemeName) {
      return;
    }

    final sp = await SharedPreferences.getInstance();

    if (await sp.setString(sp_key, name.toString())) {
      currentThemeName = name;
      notifyListeners();
    }
  }
}
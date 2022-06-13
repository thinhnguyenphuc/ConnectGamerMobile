import 'package:flutter/material.dart';

class ThemeConstants {
  static const double h5FontSize = 22;
  static const double h6FontSize = 18;
  static const double bodyFontSize = 16;
  static const double subtitle1FontSize = 18;
  static const double subtitle2FontSize = 16;
}

class Themes {
  static ThemeData getThemeOf(ThemeName name) {
    switch (name) {
      case ThemeName.dark: {
        return darkTheme();
      }
      case ThemeName.light: {
        return lightTheme();
      }
    }
  }

  static ThemeData lightTheme() {

    return createTheme(
      brightness: Brightness.light,
      primaryColor: Colors.red,
      secondaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.grey.shade200,
      canvasColor: Colors.white,
      primaryTextColor: Colors.white,
      normalTextColor: Colors.black,
      cardColor: Colors.white,
    );
  }

  static ThemeData darkTheme() {
    return createTheme(
      brightness: Brightness.dark,
      primaryColor: Colors.red,
      secondaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: const Color(0xFF262626),
      canvasColor: Colors.black,
      primaryTextColor: Colors.white,
      normalTextColor: Colors.white,
      cardColor: Colors.grey.shade900,
    );
  }

  static ThemeData createTheme({
    required Brightness brightness,
    Color? normalTextColor,
    Color? primaryTextColor,
    required Color primaryColor,
    required Color secondaryColor,
    required Color scaffoldBackgroundColor,
    required Color backgroundColor,
    required Color canvasColor,
    Color? cardColor,
  }) {
    return ThemeData(
      brightness: brightness,

      canvasColor: canvasColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      backgroundColor: backgroundColor,

      cardColor: cardColor,

      dividerColor: Colors.black,

      errorColor: Colors.red,

      hintColor: Colors.grey,

      colorScheme: brightness == Brightness.light? ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
      ): ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
      ),

      primaryColor: primaryColor,
      primaryColorDark: Colors.black,
      primaryTextTheme: TextTheme(
          headline5: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: ThemeConstants.h5FontSize,
            color: primaryTextColor,
          ),
          headline6: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: ThemeConstants.h6FontSize,
            color: primaryTextColor,
          )
      ),
      textTheme: TextTheme(
        headline5: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: ThemeConstants.h5FontSize,
          color: normalTextColor,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: ThemeConstants.h6FontSize,
          color: normalTextColor,
        ),
        bodyText1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: ThemeConstants.bodyFontSize,
          color: normalTextColor,
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: ThemeConstants.bodyFontSize,
          color: normalTextColor,
        ),
        subtitle1: TextStyle(
          fontSize: ThemeConstants.subtitle1FontSize,
          fontWeight: FontWeight.bold,
          color: normalTextColor,
        ),
        subtitle2: TextStyle(
          fontSize: ThemeConstants.subtitle2FontSize,
          fontWeight: FontWeight.bold,
          color: normalTextColor,
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        backgroundColor: scaffoldBackgroundColor,
        unselectedItemColor: normalTextColor,
      ),

      tabBarTheme: TabBarTheme(
        labelColor: primaryColor,
        unselectedLabelColor: Colors.grey,
      ),

    );
  }

  static Gradient getGradientFrom(ThemeData theme) {
    return LinearGradient(
        colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.7, 0.0),
        stops: const [0.0, 1],
        tileMode: TileMode.clamp
    );
  }

  static Color getBubbleColorOf(ThemeData theme) {
    return theme.brightness == Brightness.light? Colors.grey.shade200 : Colors.grey.shade800;
  }
}

enum ThemeName {
  light,
  dark,
}
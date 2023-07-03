import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/config/font.dart';
import '/resources/themes/styles/color_styles.dart';
import '/resources/themes/text_theme/default_text_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Dark Theme
|
| Theme Config - config/theme.dart
|--------------------------------------------------------------------------
*/

ThemeData darkTheme(ColorStyles color) {
  TextTheme darkTheme =
      getAppTextTheme(appFont, defaultTextTheme.merge(_textTheme(color)));
  return ThemeData(
    useMaterial3: true,
    primaryColor: color.green,
    primaryColorDark: color.green,
    focusColor: color.green50,
    scaffoldBackgroundColor: color.dark100,
    appBarTheme: AppBarTheme(
        backgroundColor: color.dark100,
        titleTextStyle: darkTheme.titleLarge!.copyWith(color: color.white),
        iconTheme: IconThemeData(color: color.white),
        elevation: 1.0,
        systemOverlayStyle: SystemUiOverlayStyle.light),
    buttonTheme: ButtonThemeData(
      buttonColor: color.green,
      colorScheme: ColorScheme.light(primary: color.white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: color.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: color.white, backgroundColor: color.green),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(side: BorderSide(color: color.green600)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: color.green600,
      unselectedIconTheme: IconThemeData(color: color.white),
      selectedIconTheme: IconThemeData(color: color.green),
      unselectedLabelStyle: TextStyle(color: color.white),
      selectedLabelStyle: TextStyle(color: color.green),
      selectedItemColor: color.green,
    ),
    textTheme: darkTheme,
    colorScheme: ColorScheme.dark(background: color.dark100),
  );
}

/*
|--------------------------------------------------------------------------
| Dark Text Theme
|--------------------------------------------------------------------------
*/

TextTheme _textTheme(ColorStyles colors) {
  Color primaryContent = colors.white;
  TextTheme textTheme = TextTheme().apply(displayColor: primaryContent);
  return textTheme.copyWith(
      titleLarge: TextStyle(color: primaryContent.withOpacity(0.8)),
      labelLarge: TextStyle(color: primaryContent.withOpacity(0.8)),
      bodySmall: TextStyle(color: primaryContent.withOpacity(0.8)),
      bodyMedium: TextStyle(color: primaryContent.withOpacity(0.8)));
}

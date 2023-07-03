import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/config/font.dart';
import '/resources/themes/styles/color_styles.dart';
import '/resources/themes/text_theme/default_text_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Light Theme
|
| Theme Config - config/theme.dart
|--------------------------------------------------------------------------
*/

ThemeData lightTheme(ColorStyles color) {
  TextTheme lightTheme =
      getAppTextTheme(appFont, defaultTextTheme.merge(_textTheme(color)));

  return ThemeData(
    useMaterial3: true,
    primaryColor: color.green,
    primaryColorLight: color.green,
    focusColor: color.green,
    scaffoldBackgroundColor: color.white,
    hintColor: color.blue,
    dividerTheme: DividerThemeData(color: color.grey600),
    appBarTheme: AppBarTheme(
      backgroundColor: color.green,
      titleTextStyle: lightTheme.titleLarge!.copyWith(color: color.white),
      iconTheme: IconThemeData(color: color.grey600),
      elevation: 1.0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: color.green,
      colorScheme: ColorScheme.light(primary: color.green),
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
      backgroundColor: color.green50,
      unselectedIconTheme: IconThemeData(color: color.grey600),
      selectedIconTheme: IconThemeData(color: color.green),
      unselectedLabelStyle: TextStyle(color: color.grey600),
      selectedLabelStyle: TextStyle(color: color.green),
      selectedItemColor: color.green,
    ),
    textTheme: lightTheme,
    colorScheme:
        ColorScheme.light(background: color.white, primary: color.green),
  );
}

/*
|--------------------------------------------------------------------------
| Light Text Theme
|--------------------------------------------------------------------------
*/

TextTheme _textTheme(ColorStyles colors) {
  Color primaryContent = colors.black;
  TextTheme textTheme = TextTheme().apply(displayColor: primaryContent);
  return textTheme.copyWith(
      labelLarge: TextStyle(color: primaryContent.withOpacity(0.8)));
}

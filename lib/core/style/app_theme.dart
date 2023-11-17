import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';

final appLightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: MyColors.darkYellow,
    centerTitle: true,
  ),
  brightness: Brightness.light,
  primaryColor: MyColors.darkYellow,
  colorScheme: const ColorScheme.light(
    primary: MyColors.darkYellow,
  ),
  progressIndicatorTheme:
  const ProgressIndicatorThemeData(color: MyColors.darkYellow),
);

final appDarkTheme = ThemeData(
  scaffoldBackgroundColor: MyColors.Black,
  appBarTheme: const AppBarTheme(
    backgroundColor: MyColors.DarkGrey2,
    titleTextStyle: TextStyle(color: MyColors.White),
  ),
  brightness: Brightness.dark,
  primaryColor: MyColors.Black,
  colorScheme: const ColorScheme.dark(
    primary: MyColors.White,
    onPrimary: MyColors.Black,
  ),

);



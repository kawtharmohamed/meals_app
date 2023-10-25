import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';

final appTheme = ThemeData(
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
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: MyColors.darkYellow,
      foregroundColor: MyColors.White,
    ),
);

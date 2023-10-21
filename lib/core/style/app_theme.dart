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
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(color: MyColors.darkYellow),
        iconColor: MyColors.White,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.White),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.darkYellow),
          borderRadius: BorderRadius.circular(8),
        )));

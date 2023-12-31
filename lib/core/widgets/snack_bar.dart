import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/lang/locale_keys.g.dart';

class SnackBarMessage {
  void showSuccessSnackBar(
      {required BuildContext context}) {
    final isDarkMode = Theme.of(context).brightness== Brightness.dark;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar( duration: Duration(seconds: 2),
        content: Text(
          LocaleKeys.Add.tr(),
          style: TextStyle(color: MyColors.White),
        ),
        backgroundColor: isDarkMode ? MyColors.Black : MyColors.darkYellow,
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.vertical(
           top: Radius.circular(15),
         ),
       ),
      ),
    );
  }
}
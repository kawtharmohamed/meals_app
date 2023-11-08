import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';

class SnackBarMessage {
  void showSuccessSnackBar(
      {required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(
        content: Text(
          "Meal Added Successfully",
          style: TextStyle(color: MyColors.White),
        ),
        backgroundColor:MyColors.darkYellow,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.vertical(
           top: Radius.circular(15),
         ),
       ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

Widget txt(
    BuildContext context,
    String text,
    double size,
    FontWeight weight,
    FontStyle style,
    ) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final textColor = isDarkMode ? Colors.white : Colors.black;

  return Text(
    text,
    style: TextStyle(
      color: textColor,
      fontSize: size,
      fontWeight: weight,
      fontStyle: style,
    ),
  );
}
Widget txt2(
    Color color,
    String text,
    double size,
    FontWeight weight,
    FontStyle style,
    ) {

  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
      fontStyle: style,
    ),
  );
}

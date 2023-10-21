import 'package:flutter/material.dart';

Widget txt(Color color, String text, double size, FontWeight wieght,
        FontStyle style) =>
    Text(
      text,
      style: TextStyle(
          fontSize: size, color: color, fontWeight: wieght, fontStyle: style),
    );

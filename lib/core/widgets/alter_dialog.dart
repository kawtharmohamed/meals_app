import 'package:flutter/material.dart';

Widget showDialogg (Function () onPressed) =>
    AlertDialog(
      title: Text("No Internet Connection"),
      actions: [
        ElevatedButton(
          onPressed: onPressed,
          child: Text("Refresh"),
        ),
      ],
    );
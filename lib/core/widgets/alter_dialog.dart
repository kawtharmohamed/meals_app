import 'package:flutter/material.dart';

Widget showDialogg (Function () onPressed1 ,Function () onPressed2 ) =>
    AlertDialog(
      title: Text("No Internet Connection"),
      actions: [
        ElevatedButton(
          onPressed: onPressed1,
          child: Text("Refresh"),
        ),
        ElevatedButton(
          onPressed: onPressed2,
          child: Text("Back"),
        ),
      ],
    );
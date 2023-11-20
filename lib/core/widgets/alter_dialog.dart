import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/lang/locale_keys.g.dart';

Widget showDialogg(Function() onPressed1, Function() onPressed2) => AlertDialog(
      title: Text(LocaleKeys.Internet.tr()),
      actions: [
        ElevatedButton(
          onPressed: onPressed1,
          child: Text(LocaleKeys.Refresh.tr()),
        ),
        ElevatedButton(
          onPressed: onPressed2,
          child: Text(LocaleKeys.Back.tr()),
        ),
      ],
    );
Widget chooseLanguageDialog(
        Function() onPressed1, Function() onPressed2, Function() onPressed3) =>
    AlertDialog(
      title: Text(LocaleKeys.Choose.tr()),
      actions: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: onPressed1,
                    child: Text(LocaleKeys.English.tr()),
                  ),
                  ElevatedButton(
                    onPressed: onPressed2,
                    child: Text(LocaleKeys.Arabic.tr()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180.0),
              child: TextButton(
                onPressed: onPressed3,
                child: Text(LocaleKeys.Cancel.tr()),
              ),
            ),
          ],
        )
      ],
    );

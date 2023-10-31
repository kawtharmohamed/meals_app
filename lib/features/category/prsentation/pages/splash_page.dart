import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/core/utils/text.dart';

import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            "assets/images/meal.png",
            width: 170,
            height: 170,
          ),
          Padding(
            padding:const EdgeInsets.only(top: 10.0),
            child: txt(MyColors.Black, "Food Fusion", 27, FontWeight.w600, FontStyle.italic),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: LoadingAnimationWidget.fourRotatingDots(
              color: MyColors.Black,
              size: 50,
            ),
          ),
        ],
      ),
      nextScreen:const HomePage(),
      duration: 2500,
      backgroundColor: MyColors.darkYellow,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 390,
    );
  }
}

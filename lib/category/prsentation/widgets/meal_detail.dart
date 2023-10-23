import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/category/prsentation/pages/home_page.dart';
import 'package:meals_app/category/prsentation/widgets/meals_list.dart';
import 'package:meals_app/core/style/colors.dart';

import '../../../core/utils/navigate_to.dart';
import '../../../core/utils/text.dart';
import '../../data/models/meal_model.dart';
import '../../domain/entities/meal.dart';

class MealDetailWidget extends StatelessWidget{
  final MealModel meal;
  const MealDetailWidget({super.key, required this.meal});
  @override
  Widget build(BuildContext context) {
    print(' ${meal.strMealThumb}');
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 330,
                width: double.infinity,
                decoration:  BoxDecoration(
                  image: DecorationImage( image:NetworkImage(meal.strMealThumb??"" ),
                    fit: BoxFit.fill,
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 45.0,
                  left: 20,
                ),
                child: Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                        //   navigateTo(context, HomePage(categories: categories));
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 270.0),
                child: Container(
                  height: 480,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        txt(Colors.black, meal.strMeal??'', 20, FontWeight.w600 , FontStyle.normal),
                        const SizedBox(height: 5),
                        const SizedBox(
                          height: 15,
                        ),
                        txt(MyColors.LightGrey1, meal.strArea??'', 15, FontWeight.w500 , FontStyle.normal),
                        SizedBox(
                          width: 5,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        txt(MyColors.LightGrey1, meal.strDrinkAlternate??'', 15, FontWeight.w500 , FontStyle.normal),
                        SizedBox(
                          width: 5,
                        ),
                     //   txt(MyColors.LightGrey1, meal.strInstructions??'', 15, FontWeight.w500 , FontStyle.normal),
                     //   const SizedBox(
                     //     height: 17,
                     //   ),
                     //   SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
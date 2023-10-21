import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/category/prsentation/pages/meal_detail_page.dart';
import 'package:meals_app/category/prsentation/widgets/meal_detail.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/core/utils/navigate_to.dart';
import 'package:meals_app/core/utils/text.dart';

import '../../data/models/meal_model.dart';
import '../../domain/entities/meal.dart';

class MealsList extends StatelessWidget{
  final List<MealModel> meals;

  const MealsList({super.key, required this.meals });
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context , index) {
        return GestureDetector(
          onTap: navigateTo(context,MealDetailPage(meal: meals[index])),
          child: Card( elevation: 3,
            child: Column(children: [
              Image.asset(meals[index].strMealThumb , width: 120,
                height: 120,),
              SizedBox(height: 10),
              txt(MyColors.Black, meals[index].strMeal, 15, FontWeight.w500 , FontStyle.normal),
            ],),
          ),
        );
      },
      itemCount: meals.length,
    )
      ,);

  }

}

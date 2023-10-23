import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/core/utils/navigate_to.dart';
import 'package:meals_app/core/utils/text.dart';
import '../../data/models/meal_model.dart';
import '../pages/meal_detail_page.dart';
class MealsList extends StatelessWidget {
  final List<MealModel> meals;

 const MealsList({Key? key, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () =>Navigator.push(context, MaterialPageRoute
              (builder:(context)=>MealDetailPage(meal: meals[index])),),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0 , right: 10 , left: 10),
                  child: Column(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        child: Image.network(meals[index].strMealThumb??''),
                      ),
                      const SizedBox(height: 10),
                      txt(
                        MyColors.Black,
                        meals[index].strMeal??'',
                        15,
                        FontWeight.w500,
                        FontStyle.normal,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}


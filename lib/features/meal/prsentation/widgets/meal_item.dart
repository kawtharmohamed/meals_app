import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meal/prsentation/bloc/fav_meals_bloc.dart';
import 'package:meals_app/features/meal/prsentation/bloc/meal_events.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/style/colors.dart';
import '../../../meal_detail/prsentation/pages/meal_detail_page.dart';
import '../../domain/entities/meal.dart';
import '../bloc/meal_bloc.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({super.key, required this.meal});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MealDetailPage(meal: meal, strCategory: '',),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    right: 15,
                    left: 15,
                  ),
                  child: SizedBox(height: 180,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.network(
                            meal.strMealThumb ?? '',
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 15),
                          ReadMoreText(
                            meal.strMeal ?? '',
                            trimLines: 2,
                            colorClickableText: MyColors.Black,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: const TextStyle(
                              fontSize: 15,
                              color: MyColors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            lessStyle: const TextStyle(
                              fontSize: 15,
                              color: MyColors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 137.0),
          child: Container(
            width: 37,
            height: 37,
            decoration: const BoxDecoration(
              color: MyColors.DarkGrey,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color:meal.isFavourite? MyColors.red : MyColors.White,
                size: 23,
              ),
              onPressed: () {
                  BlocProvider.of<MealsBloc>(context).add(AddMealEvent(meal: meal));
              },
            ),
          ),
        ),
      ],
    );
  }
}

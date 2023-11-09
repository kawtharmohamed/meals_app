import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meal/prsentation/bloc/meal_events.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/widgets/text.dart';
import '../../domain/entities/meal.dart';
import '../bloc/meal_bloc.dart';

class FavMealItem extends StatelessWidget{
  List <Meal> favMeals ;
 FavMealItem( {required this.favMeals});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: favMeals.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Card(
            color: MyColors.LightGrey,
            elevation: 2,
            child: Container(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ListTile(
                  leading: ClipOval(
                    child: Image.network("${favMeals[index].strMealThumb??''}"),
                  ),
                  title: txt(MyColors.Black, "${favMeals[index].strMeal??''}", 17,
                      FontWeight.w600, FontStyle.normal),
                  trailing: IconButton(
                    onPressed: () async {
                      BlocProvider.of<MealsBloc>(context).add(DeleteMealEvent(mealId:
                      "${favMeals[index].idMeal??''}"));
                    },
                    icon: Icon(
                      Icons.delete,
                      color: MyColors.red,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meal/prsentation/bloc/meal_events.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/widgets/text.dart';
import '../../domain/entities/meal.dart';
import '../bloc/meal_bloc.dart';

class FavMealItem extends StatelessWidget{
  final List <Meal> favMeals ;
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
              height: 95,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ListTile(
                  leading: ClipOval(
                    child: Image.network( favMeals[index].strMealThumb?? ''),
                  ),
                  title: ReadMoreText(
                    favMeals[index].strMeal ?? '' ,style:TextStyle(fontWeight: FontWeight.bold) ,
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
                  trailing: IconButton(
                    onPressed: () async {
                      BlocProvider.of<MealsBloc>(context).add(DeleteMealEvent(mealId:
                      favMeals[index].idMeal??''));
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
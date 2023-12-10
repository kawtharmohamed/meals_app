import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meal/prsentation/bloc/meal_events.dart';
import 'package:readmore/readmore.dart';
import '../../../../core/style/colors.dart';
import '../../domain/entities/meal.dart';
import '../bloc/meal_bloc.dart';

class FavMealItem extends StatelessWidget{
  final List <Meal> favMeals ;
 const FavMealItem( {super.key, required this.favMeals});
  @override
  Widget build(BuildContext context) {
    final  isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: favMeals.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Card(
            color: isDarkMode? MyColors.DarkGrey3: MyColors.LightGrey,
            elevation: 2,
            child: SizedBox(
              height: 95,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ListTile(
                  leading: ClipOval(
                    child: Image.network( favMeals[index].strMealThumb?? ''),
                  ),
                  title: ReadMoreText(
                    favMeals[index].strMeal ?? '' ,style:const TextStyle(fontWeight: FontWeight.bold) ,
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
                    icon: const Icon(
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meal/prsentation/bloc/fav_meals_bloc.dart';
import 'package:meals_app/features/meal/prsentation/bloc/meal_events.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/widgets/text.dart';
import '../../domain/entities/meal.dart';
import '../bloc/meal_bloc.dart';

class FavMealItem extends StatelessWidget{
  List favMeals = [];

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
                    child: Image.network("${favMeals[index]['image']}"),
                  ),
                  title: txt(MyColors.Black, "${favMeals[index]['name']}", 17,
                      FontWeight.w600, FontStyle.normal),
                  trailing: IconButton(
                    onPressed: () async {
                      /* String deletedId = favMeals[index]['id'].toString();
                        int response = await sql.deleteData("meals", "id=$deletedId");
                        if (response > 0) {
                          setState(() {
                            favMeals.removeAt(index);
                          });
                          print(response);
                        }*/
                      BlocProvider.of<MealsBloc>(context)..add(DeleteMealEvent(mealId:
                      "${favMeals[index]['id']}"));
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/core/widgets/snack_bar.dart';
import 'package:meals_app/features/meal/prsentation/widgets/meal_item.dart';
import 'package:readmore/readmore.dart';
import '../../../../core/sqflite/sqf.dart';
import '../../../meal_detail/prsentation/pages/meal_detail_page.dart';
import '../../domain/entities/meal.dart';
import '../bloc/meal_bloc.dart';
import '../bloc/meal_events.dart';

class MealsList extends StatelessWidget{
  final List<Meal> meals;
  TextEditingController searchController = TextEditingController();
 MealsList({ super.key ,required this.meals});
 /* void initState() {
    super.initState();
    filteredMeals = widget.meals;
   // loadFavoriteMealIds();
  } */

/*  void loadFavoriteMealIds() async {
    final favoriteMeals = await sql.readData("meals");
    setState(() {
      favoriteMealIds = favoriteMeals.map((meal) => meal['id'].toString()).toList();
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 65,
            color: MyColors.darkYellow,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: MyColors.White.withOpacity(0.45),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: ( String searchedCharacter) {
                    BlocProvider.of<MealsBloc>(context).add
                      (SearchEvent(searchedCharacter: searchedCharacter));
                  },
                  decoration: InputDecoration(
                    hintText: "Find a Meal..",
                    prefixIcon: Icon(Icons.search, size: 22),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchController.clear();
                      },
                      icon: Icon(Icons.clear, size: 22),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
              ),
              itemBuilder: (context, index) {

               return MealItem(meal: meals[index]);
              },
              itemCount: meals.length,
            ),
          ),
        ],
      ),
    );
  }
}

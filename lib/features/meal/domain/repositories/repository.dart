import 'package:dartz/dartz.dart';

import '../entities/meal.dart';


abstract class MealRepository {
  Future<List<Meal>> getAllMeals(String strCategory);
  Future <void> insertData( Meal meal);
  Future <List<Meal>> readData();
  Future <void> deleteData(String mealId);
 // Future<List<Meal>> search (String searchedCharacter);

}

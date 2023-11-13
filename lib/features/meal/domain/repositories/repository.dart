import 'package:dartz/dartz.dart';

import '../entities/meal.dart';


abstract class MealRepository {
  Future<List<Meal>> getAllMeals(String strCategory);
  Future<void> insertData( Meal meal);
  Future <List<Meal>> readData();
  Future<List<Meal>> deleteData(String mealId);

}

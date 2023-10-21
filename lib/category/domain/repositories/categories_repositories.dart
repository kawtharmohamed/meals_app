import 'package:meals_app/category/data/models/meal_model.dart';

import '../../data/models/category_model.dart';
import '../entities/category.dart';
import '../entities/meal.dart';

abstract class Repository {
  Future<List<CategoryModel>> getAllCategories();
  Future<List<MealModel>> getAllMeals(String strCategory);
  Future<MealModel> getMealById(int idMeal);
}

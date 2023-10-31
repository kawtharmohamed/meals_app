import '../../data/models/meal_model.dart';

abstract class MealRepository {
  Future<List<MealModel>> getAllMeals(String strCategory);
}

import '../../../meal/domain/entities/meal.dart';

abstract class MealDetailRepository {
  Future<Meal> getMealById(String idMeal);
}

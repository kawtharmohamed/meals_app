
import '../../data/models/meal_detail_model.dart';

abstract class MealDetailRepository {
  Future<MealDetailModel> getMealById(String idMeal);
}

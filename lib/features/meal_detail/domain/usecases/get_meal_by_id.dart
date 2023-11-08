import 'package:meals_app/features/meal_detail/domain/repositories/repository.dart';

import '../../../meal/domain/entities/meal.dart';

class GetMealByIdUsecase {
  final MealDetailRepository mealDetailRepository;

  GetMealByIdUsecase(this.mealDetailRepository);
  Future<Meal> call(String idMeal) async {
    return await mealDetailRepository.getMealById(idMeal);
  }
}

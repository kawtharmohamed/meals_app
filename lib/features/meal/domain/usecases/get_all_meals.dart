import 'package:meals_app/features/meal/domain/repositories/repository.dart';
import '../entities/meal.dart';

class GetAllMealsUsecase {
  final MealRepository mealRepository;

  GetAllMealsUsecase(this.mealRepository);

  Future<List<Meal>> call(String strCategory) async {
    return await mealRepository.getAllMeals(strCategory);
  }
}

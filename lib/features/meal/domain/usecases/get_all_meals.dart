import 'package:meals_app/features/meal/domain/repositories/repository.dart';
import '../../data/models/meal_model.dart';

class GetAllMealsUsecase {
  final MealRepository mealRepository;

  GetAllMealsUsecase(this.mealRepository);

  Future<List<MealModel>> call(String strCategory) async {
    return await mealRepository.getAllMeals(strCategory);
  }
}

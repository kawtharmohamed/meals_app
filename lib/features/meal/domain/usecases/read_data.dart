import 'package:meals_app/features/meal/domain/repositories/repository.dart';

import '../entities/meal.dart';

class ReadDataUsecase {
  final MealRepository mealRepository;

  ReadDataUsecase(this.mealRepository);
  Future<List<Meal>> call(){
    return mealRepository.readData();
  }
}
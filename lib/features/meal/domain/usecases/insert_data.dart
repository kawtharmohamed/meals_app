import 'package:dartz/dartz.dart';
import 'package:meals_app/features/meal/domain/repositories/repository.dart';

import '../entities/meal.dart';

class InsertDataUsecase {
  final MealRepository mealRepository;

  InsertDataUsecase(this.mealRepository);
  Future<void> call (Meal meal) async {
    return await mealRepository.insertData(meal);

  }
}

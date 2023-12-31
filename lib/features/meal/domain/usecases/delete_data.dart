import 'package:dartz/dartz.dart';
import 'package:meals_app/features/meal/domain/repositories/repository.dart';

import '../entities/meal.dart';

class DeleteDataUsecase {
  final MealRepository mealRepository;

  DeleteDataUsecase(this.mealRepository);
  Future <List<Meal>> call (String mealId) async {
    return await mealRepository.deleteData(mealId);

  }
}

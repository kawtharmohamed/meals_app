import 'package:dartz/dartz.dart';
import 'package:meals_app/features/meal/domain/repositories/repository.dart';

class DeleteDataUsecase {
  final MealRepository mealRepository;

  DeleteDataUsecase(this.mealRepository);
  Future<Unit> call (String mealId) async {
    return await mealRepository.deleteData(mealId);

  }
}

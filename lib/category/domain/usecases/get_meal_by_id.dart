import 'package:meals_app/category/domain/repositories/categories_repositories.dart';
import '../../data/models/meal_model.dart';
class GetMealByIdUsecase{
   final Repository repository;

   GetMealByIdUsecase(this.repository);
  Future <MealModel> call( String idMeal)  async{
    return await repository.getMealById(idMeal);
  }
}
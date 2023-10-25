import 'package:meals_app/category/domain/repositories/categories_repositories.dart';
import '../../data/models/meal_model.dart';

class GetAllMealsUsecase{
   final Repository repository;
   GetAllMealsUsecase(this.repository);
  Future <List<MealModel>> call(String strCategory)  async{
    return await repository.getAllMeals(strCategory);
  }
}
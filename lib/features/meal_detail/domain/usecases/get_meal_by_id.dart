import 'package:meals_app/features/meal_detail/domain/repositories/repository.dart';
import '../../data/models/meal_detail_model.dart';
class GetMealByIdUsecase{
   final MealDetailRepository mealDetailRepository;

   GetMealByIdUsecase(this.mealDetailRepository);
  Future <MealDetailModel> call( String idMeal)  async{
    return await mealDetailRepository.getMealById(idMeal);
  }
}
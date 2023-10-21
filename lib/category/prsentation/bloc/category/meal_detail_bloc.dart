
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/category/domain/usecases/get_meal_by_id.dart';

import 'categorymeal_event.dart';
import 'categorymeal_state.dart';

class MealsDetailBloc extends Bloc<CategoriesMealsEvents, CategoriesMealsStates> {
  final GetMealByIdUsecase getMealById;

  MealsDetailBloc({required this.getMealById , required int idMeal}) : super(CategoriesMealsInitial()) {
    on<CategoriesMealsEvents>((event, emit) async {
      if (event is MealByIdEvent) {
        emit(LoadingState());
        final meal = await getMealById(idMeal);
        emit( LoadedMealsDetailState(meal: meal));
      } else if (event is RefreshEvent) {
        emit(LoadingState());
        final meal = await getMealById(idMeal);
        emit( LoadedMealsDetailState(meal: meal));
      }
      //emit(ErrorCategoriesState(message: message));
    });
  }
}

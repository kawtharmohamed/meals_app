
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_all_meals.dart';
import 'categorymeal_event.dart';
import 'categorymeal_state.dart';

class MealsBloc extends Bloc<CategoriesMealsEvents, CategoriesMealsStates> {
 final GetAllMealsUsecase getAllMeals;
 late String strCategory;

 MealsBloc({required this.getAllMeals }) : super(CategoriesMealsInitial()) {
    on<CategoriesMealsEvents>((event, emit) async {
      if (event is AllMealsEvent) {
        emit(LoadingState());
        strCategory = event.strCategory;
        final meals = await getAllMeals(strCategory);
       emit( LoadedMealsState(meals: meals));
      } else if (event is RefreshEvent) {
        emit(LoadingState());
        final meals = await getAllMeals(strCategory);
        emit( LoadedMealsState(meals: meals));
      }
      //emit(ErrorCategoriesState(message: message));
    });
  }
}

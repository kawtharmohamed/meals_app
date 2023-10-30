import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_all_meals.dart';
import 'categorymeal_event.dart';
import 'categorymeal_state.dart';

class MealsBloc extends Bloc<CategoriesMealsEvents, CategoriesMealsStates> {
  final GetAllMealsUsecase getAllMeals;
  late String strCategory;

  MealsBloc({required this.getAllMeals}) : super(CategoriesMealsInitial()) {
    on<CategoriesMealsEvents>((event, emit) async {
      if (event is AllMealsEvent) {
        emit(LoadingState());
        strCategory = event.strCategory;
        try {
          final meals = await getAllMeals(strCategory);
          emit(LoadedMealsState(meals: meals));
        } catch (e) {
          emit(ErrorState(
            message: 'No Internet Connection',
          ));
        }
      } else if (event is RefreshEvent) {
        emit(LoadingState());
        try {
          final meals = await getAllMeals(strCategory);
          emit(LoadedMealsState(meals: meals));
        } catch (e) {
          emit(ErrorState(
            message: 'No Internet Connection',
          ));
        }
      }
    });
  }
}

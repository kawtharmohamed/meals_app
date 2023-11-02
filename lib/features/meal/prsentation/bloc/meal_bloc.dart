import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_all_meals.dart';
import 'meal_events.dart';
import 'meal_states.dart';

class MealsBloc extends Bloc<MealsEvents, MealsStates> {
  final GetAllMealsUsecase getAllMeals;
  late String strCategory;

  MealsBloc({required this.getAllMeals}) : super(MealsInitial()) {
    on<MealsEvents>((event, emit) async {
      if (event is AllMealsEvent) {
        emit(LoadingState());
        strCategory = event.strCategory;
        try {
          final meals = await getAllMeals(strCategory);
          emit(LoadedMealsState(meals: meals));
        } catch (e) {
          emit(ErrorState());
        }
      } else if (event is RefreshMealEvent) {
        emit(LoadingState());
        try {
          final meals = await getAllMeals(strCategory);
          emit(LoadedMealsState(meals: meals));
        } catch (e) {
          emit(ErrorState());
        }
      }
    });
  }
}

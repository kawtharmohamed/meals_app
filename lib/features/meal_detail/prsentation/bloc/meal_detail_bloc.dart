import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_meal_by_id.dart';
import 'meal_detail_events.dart';
import 'meal_detail_states.dart';

class MealsDetailBloc extends Bloc<MealDetailEvents, MealDetailStates> {
  final GetMealByIdUsecase getMealById;
  late String idMeal;

  MealsDetailBloc({required this.getMealById}) : super(MealDetailInitial()) {
    on<MealDetailEvents>((event, emit) async {
      if (event is MealByIdEvent) {
        emit(LoadingState());
        idMeal = event.idMeal;
        try {
          final meal = await getMealById(idMeal);
          emit( LoadedMealsDetailState(meal: meal));
        } catch(e) {
          emit(ErrorState(message: "No Internet Connection"));
        }
      } else if (event is RefreshMealDetailEvent) {
        emit(LoadingState());
        try {
          final meal = await getMealById(idMeal);
          emit(LoadedMealsDetailState(meal:meal));
        } catch (e) {
          emit(ErrorState(
            message: 'No Internet Connection.',
          ));
        }
      }
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/endpoints/end_points.dart';
import '../../domain/usecases/delete_data.dart';
import '../../domain/usecases/get_all_meals.dart';
import '../../domain/usecases/insert_data.dart';
import '../../domain/usecases/read_data.dart';
import 'meal_events.dart';
import 'meal_states.dart';

class FavMealsBloc extends Bloc<MealsEvents, MealsStates> {
   final InsertDataUsecase insertData;
   final DeleteDataUsecase deleteData;
   final ReadDataUsecase readData;

  FavMealsBloc(this.insertData, this.deleteData, this.readData ) : super(MealsInitial()) {
    on<MealsEvents>((event, emit) async {
      if (event is ReadMealEvent) {
        emit(LoadingState());
        final favMeals = await readData();
        emit(LoadedFavMealsState(favMeals: favMeals));
      } else if (event is AddMealEvent) {
        emit(LoadingState());
        final doneMessage = await insertData(event.meal);
        if (doneMessage == 'success') {
          emit(MessageState());
        } else {
          emit(ErrorState());
        }
      } else if (event is DeleteMealEvent) {
        emit(LoadingState());
        final doneMessage = await deleteData(event.mealId);
        if (doneMessage == 'success') {
          emit(MessageState());
        } else {
          emit(ErrorState());
        }
      }
    });
  }
}

/*
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
} */
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/delete_data.dart';
import '../../domain/usecases/get_all_meals.dart';
import '../../domain/usecases/insert_data.dart';
import '../../domain/usecases/read_data.dart';
import 'meal_events.dart';
import 'meal_states.dart';
import 'dart:collection';

class MealsBloc extends Bloc<MealsEvents, MealsStates> {
  final GetAllMealsUsecase getAllMeals;
  late String strCategory;
  final InsertDataUsecase insertData;
  final DeleteDataUsecase deleteData;
  final ReadDataUsecase readData;

  MealsBloc(
      {required this.getAllMeals,
      required this.deleteData,
      required this.insertData,
      required this.readData})
      : super(MealsInitial()) {
    on<MealsEvents>((event, emit) async {
      if (event is AllMealsEvent) {
        emit(LoadingState());
        strCategory = event.strCategory;
        try {
          final meals = await getAllMeals(strCategory);
         final favMeals=  await readData();
         for (int i=0 ; i > meals.length; i++){
         //  var isFavourite = favMeals.firstWhere((meal) => meal.idMeal == meals[i].idMeal);
         //  if (isFavourite != null){
         //    meals[i].isFavourite= true;
         //  }
         }
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
      } else if (event is ReadMealEvent) {
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

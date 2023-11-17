import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/meal.dart';
import '../../domain/usecases/delete_data.dart';
import '../../domain/usecases/get_all_meals.dart';
import '../../domain/usecases/insert_data.dart';
import '../../domain/usecases/read_data.dart';
import '../pages/meal_page.dart';
import 'meal_events.dart';
import 'meal_states.dart';
import 'package:collection/collection.dart';

class MealsBloc extends Bloc<MealsEvents, MealsStates> {
  final GetAllMealsUsecase getAllMeals;
  late String strCategory;
  final InsertDataUsecase insertData;
  final DeleteDataUsecase deleteData;
  final ReadDataUsecase readData;
  List<Meal> _allMeals = [];
  List<Meal> _favoriteMeals = [];
  MealsBloc({
    required this.getAllMeals,
    required this.deleteData,
    required this.insertData,
    required this.readData,
  }) : super(MealsInitial()) {
    on<MealsEvents>((event, emit) async {
      if (event is AllMealsEvent) {
        emit(LoadingState());
        strCategory = event.strCategory;
        try {
          final meals = await getAllMeals(strCategory);
          final favMeals = await readData();
          _allMeals = meals;
          _favoriteMeals = favMeals;
          for (int i = 0; i < meals.length; i++) {
            var isFavourite = favMeals
                .firstWhereOrNull((meal) => meal.idMeal == meals[i].idMeal);
            if (isFavourite != null) {
              meals[i].isFavourite = true;
            }
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
        final addedMeals = await insertData(event.meal);
        event.meal.isFavourite = true;
        _favoriteMeals.add(event.meal);
        _allMeals
            .firstWhere((element) => element.idMeal == event.meal.idMeal)
            .isFavourite = true;
        emit(MessageState());
        emit(LoadedMealsState(meals: _allMeals));
      } else if (event is DeleteMealEvent) {
        final updatedMeals = await deleteData(event.mealId);
        emit(LoadedFavMealsState(favMeals: updatedMeals));
      } else if (event is SearchEvent) {
        final filteredMeals = _allMeals
            .where((meal) => meal.strMeal!
                .toLowerCase()
                .startsWith(event.searchedCharacter.toLowerCase()))
            .toList();
        emit(LoadedMealsState(meals: filteredMeals));
      }
    });
  }
}

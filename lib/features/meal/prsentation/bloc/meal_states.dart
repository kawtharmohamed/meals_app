import 'package:equatable/equatable.dart';
import '../../domain/entities/meal.dart';

abstract class MealsStates extends Equatable {
  MealsStates();
  @override
  List<Object> get props => [];
}

class MealsInitial extends MealsStates {}

class LoadingState extends MealsStates {}

class LoadedMealsState extends MealsStates {
  final List<Meal> meals;
  LoadedMealsState({required this.meals});
  @override
  List<Object> get props => [meals];
}
class LoadedFavMealsState extends MealsStates{
  final List<Meal> favMeals;
  LoadedFavMealsState({required this.favMeals});
  @override
  List<Object> get props => [favMeals];
}
class AddMealState extends MealsStates{
  final List<Meal> meals;
  AddMealState({required this.meals});
  @override
  List<Object> get props => [meals];
}


class ErrorState extends MealsStates {}
class MessageState extends MealsStates {}

import 'package:equatable/equatable.dart';
import '../../domain/entities/meal.dart';

abstract class MealsStates extends Equatable {
  const MealsStates();
  @override
  List<Object> get props => [];
}

class MealsInitial extends MealsStates {}

class LoadingState extends MealsStates {}

class LoadedMealsState extends MealsStates {
  final List<Meal> meals;
  const LoadedMealsState({required this.meals});
  @override
  List<Object> get props => [meals];
}
class LoadedFavMealsState extends MealsStates{
  final List<Meal> favMeals;
  const LoadedFavMealsState({required this.favMeals});
  @override
  List<Object> get props => [favMeals];
}
class AddMealState extends MealsStates{
  final List<Meal> meals;
  const AddMealState({required this.meals});
  @override
  List<Object> get props => [meals];
}


class ErrorState extends MealsStates {}
class MessageState extends MealsStates {}

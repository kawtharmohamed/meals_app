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
class LoadedFilterdMealsState extends MealsStates{
  final List<Meal> filterdMeals;
  LoadedFilterdMealsState({required this.filterdMeals});
  @override
  List<Object> get props => [filterdMeals];
}

class ErrorState extends MealsStates {}
class MessageState extends MealsStates {}

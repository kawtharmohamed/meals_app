import 'package:equatable/equatable.dart';
import '../../../meal/domain/entities/meal.dart';

abstract class MealDetailStates extends Equatable {
  const MealDetailStates();
  @override
  List<Object> get props => [];
}

class MealDetailInitial extends MealDetailStates {}

class LoadingState extends MealDetailStates {}

class LoadedMealsDetailState extends MealDetailStates {
  final Meal meal;
  const LoadedMealsDetailState({required this.meal});
  @override
  List<Object> get props => [meal];
}

class ErrorState extends MealDetailStates {}

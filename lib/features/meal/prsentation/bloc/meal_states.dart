import 'package:equatable/equatable.dart';

import '../../data/models/meal_model.dart';

abstract class MealsStates extends Equatable{
  MealsStates();
  @override
  List<Object> get props => [];
}
class MealsInitial extends MealsStates {}

class LoadingState extends MealsStates {}

class LoadedMealsState extends MealsStates {
  final List<MealModel> meals ;
  LoadedMealsState({ required this.meals});
  @override
  List<Object> get props => [meals];
}

class ErrorState extends MealsStates {
  final String message;

  ErrorState({required this.message,
  });

  @override
  List<Object> get props => [message ];
}

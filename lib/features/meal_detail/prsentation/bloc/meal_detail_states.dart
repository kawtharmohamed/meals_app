import 'package:equatable/equatable.dart';
import '../../data/models/meal_detail_model.dart';
abstract class MealDetailStates extends Equatable{
  MealDetailStates();
  @override
  List<Object> get props => [];
}
class MealDetailInitial extends MealDetailStates {}

class LoadingState extends MealDetailStates {}


class LoadedMealsDetailState extends MealDetailStates {
  final MealDetailModel meal ;
  LoadedMealsDetailState({ required this.meal });
  @override
  List<Object> get props => [meal];
}
class ErrorState extends MealDetailStates {
}

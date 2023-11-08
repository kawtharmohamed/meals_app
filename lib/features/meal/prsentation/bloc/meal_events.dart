import 'package:equatable/equatable.dart';

import '../../domain/entities/meal.dart';

abstract class MealsEvents extends Equatable{
  MealsEvents();
  @override
  List<Object> get props => [];
}
class AllMealsEvent extends MealsEvents {
  final String strCategory;
  AllMealsEvent({required this.strCategory});
}

class RefreshMealEvent extends MealsEvents{}
class AddMealEvent extends MealsEvents{
  final Meal meal;
  AddMealEvent({required this.meal});
  @override
  List<Object> get props => [meal];

}
class DeleteMealEvent extends MealsEvents{
  final String mealId;

  DeleteMealEvent({required this.mealId});
  @override
  List<Object> get props => [mealId];
}
class ReadMealEvent extends MealsEvents{}

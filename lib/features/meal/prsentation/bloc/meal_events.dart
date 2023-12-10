import 'package:equatable/equatable.dart';

import '../../domain/entities/meal.dart';

abstract class MealsEvents extends Equatable{
  const MealsEvents();
  @override
  List<Object> get props => [];
}
class AllMealsEvent extends MealsEvents {
  final String strCategory;
  const AllMealsEvent({required this.strCategory});
}

class RefreshMealEvent extends MealsEvents{}
class AddMealEvent extends MealsEvents{
  final Meal meal;
  const AddMealEvent({required this.meal});
  @override
  List<Object> get props => [meal];

}
class DeleteMealEvent extends MealsEvents{
  final String mealId;

  const DeleteMealEvent({required this.mealId});
  @override
  List<Object> get props => [mealId];
}
class SearchEvent extends MealsEvents{
  final String searchedCharacter;
  const SearchEvent({required this.searchedCharacter});
}
class ReadMealEvent extends MealsEvents{}

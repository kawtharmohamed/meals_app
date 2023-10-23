import 'package:equatable/equatable.dart';

abstract class CategoriesMealsEvents extends Equatable{
  CategoriesMealsEvents();
  @override
  List<Object> get props => [];
}
class AllCategoriesEvent extends CategoriesMealsEvents{}
class AllMealsEvent extends CategoriesMealsEvents {
  final String strCategory;
  AllMealsEvent({required this.strCategory});
}
class MealByIdEvent extends CategoriesMealsEvents{
  final String idMeal;

  MealByIdEvent({required this.idMeal});
}
class RefreshEvent extends CategoriesMealsEvents{}

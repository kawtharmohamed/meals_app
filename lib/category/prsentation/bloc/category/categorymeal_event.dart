import 'package:equatable/equatable.dart';

abstract class CategoriesMealsEvents extends Equatable{
  CategoriesMealsEvents();
  @override
  List<Object> get props => [];
}
class AllCategoriesEvent extends CategoriesMealsEvents{}
class AllMealsEvent extends CategoriesMealsEvents {}
class MealByIdEvent extends CategoriesMealsEvents{}
class RefreshEvent extends CategoriesMealsEvents{}

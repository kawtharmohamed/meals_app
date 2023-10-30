import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:meals_app/category/data/models/meal_model.dart';

import '../../../data/models/category_model.dart';
import '../../../domain/entities/category.dart';

abstract class CategoriesMealsStates extends Equatable{
  CategoriesMealsStates();
  @override
  List<Object> get props => [];
}
class CategoriesMealsInitial extends CategoriesMealsStates {}

class LoadingState extends CategoriesMealsStates {}
class LoadedCategoriesState extends CategoriesMealsStates {
  final List<CategoryModel> categories ;
  LoadedCategoriesState({ required this.categories});
  @override
  List<Object> get props => [categories];
}
class LoadedMealsState extends CategoriesMealsStates {
  final List<MealModel> meals ;
  LoadedMealsState({ required this.meals});
  @override
  List<Object> get props => [meals];
}
class LoadedMealsDetailState extends CategoriesMealsStates {
  final MealModel meal ;
  LoadedMealsDetailState({ required this.meal });
  @override
  List<Object> get props => [meal];
}
class ErrorState extends CategoriesMealsStates {
  final String message;

  ErrorState({required this.message,
  });

  @override
  List<Object> get props => [message ];
}

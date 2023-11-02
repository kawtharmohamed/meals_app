import 'package:equatable/equatable.dart';
import '../../data/models/category_model.dart';

abstract class CategoriesStates extends Equatable{
  CategoriesStates();
  @override
  List<Object> get props => [];
}
class CategoriesInitial extends CategoriesStates {}

class LoadingState extends CategoriesStates {}
class LoadedCategoriesState extends CategoriesStates {
  final List<CategoryModel> categories ;
  LoadedCategoriesState({ required this.categories});
  @override
  List<Object> get props => [categories];
}

class ErrorState extends CategoriesStates {
/*  final String message;

  ErrorState({required this.message,
  });

  @override
  List<Object> get props => [message ];*/
}

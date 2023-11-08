import 'package:equatable/equatable.dart';
import '../../domain/entities/category.dart';

abstract class CategoriesStates extends Equatable{
  CategoriesStates();
  @override
  List<Object> get props => [];
}
class CategoriesInitial extends CategoriesStates {}

class LoadingState extends CategoriesStates {}
class LoadedCategoriesState extends CategoriesStates {
  final List<Categoryy> categories ;
  LoadedCategoriesState({ required this.categories});
  @override
  List<Object> get props => [categories];
}

class ErrorState extends CategoriesStates {}

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
  final int activeIndex;
  LoadedCategoriesState({ required this.categories , required this.activeIndex});
  @override
  List<Object> get props => [categories , activeIndex];
}

class ErrorState extends CategoriesStates {}

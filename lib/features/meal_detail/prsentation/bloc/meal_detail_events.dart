import 'package:equatable/equatable.dart';

abstract class MealDetailEvents extends Equatable{
  MealDetailEvents();
  @override
  List<Object> get props => [];
}

class MealByIdEvent extends MealDetailEvents{
  final String idMeal;

  MealByIdEvent({required this.idMeal});
}
class RefreshMealDetailEvent extends MealDetailEvents{}

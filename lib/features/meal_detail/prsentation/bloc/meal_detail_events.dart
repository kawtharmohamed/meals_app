import 'package:equatable/equatable.dart';

abstract class MealDetailEvents extends Equatable{
  const MealDetailEvents();
  @override
  List<Object> get props => [];
}

class MealByIdEvent extends MealDetailEvents{
  final String idMeal;

  const MealByIdEvent({required this.idMeal});
}
class RefreshMealDetailEvent extends MealDetailEvents{}

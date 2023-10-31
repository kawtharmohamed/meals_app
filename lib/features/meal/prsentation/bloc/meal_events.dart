import 'package:equatable/equatable.dart';

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

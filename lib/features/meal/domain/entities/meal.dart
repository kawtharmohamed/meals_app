import 'package:equatable/equatable.dart';

class Meal extends Equatable{
  final int? idMeal;
  final String strMeal;
  final String strMealThumb;

  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,

  });
  @override
  // TODO: implement props
  List<Object?> get props => [ idMeal ,strMeal , strMealThumb ,
  ];

}
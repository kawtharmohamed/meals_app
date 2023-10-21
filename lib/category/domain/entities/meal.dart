import 'package:equatable/equatable.dart';

class Meal extends Equatable{
  final int? idMeal;
  final String strMeal;
  final String strDrinkAlternate;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strTags;
  final String strYoutube;

  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,

  });
  @override
  // TODO: implement props
  List<Object?> get props => [ idMeal ,strMeal , strDrinkAlternate , strCategory , strArea ,
    strInstructions, strMealThumb , strTags , strYoutube
  ];

}
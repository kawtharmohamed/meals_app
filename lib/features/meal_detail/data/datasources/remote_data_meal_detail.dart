import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/endpoints/end_points.dart';
import '../../../meal/data/models/meal_model.dart';

abstract class RemoteDataMealDetail {
  Future<MealModel> getMealById(String idMeal);
}

class RemoteDataMealDetailImpl extends RemoteDataMealDetail {
  final http.Client client;

  RemoteDataMealDetailImpl(this.client);

  @override
  Future<MealModel> getMealById(String idMeal) async {
    final response = await client.get(Uri.parse('$mealById$idMeal'));
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final meals = decodedJson["meals"] as List;
      if (meals.isNotEmpty) {
        return MealModel.fromJson(meals.first);
      }
    }
    throw Exception("Failed to fetch meal details");
  }
}

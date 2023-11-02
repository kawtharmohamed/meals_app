import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/endpoints/end_points.dart';
import '../models/meal_model.dart';

abstract class RemoteDataMeal {
  Future<List<MealModel>> getAllMeals(String strCategory);
}

class RemoteDataMealImpl extends RemoteDataMeal {
  final http.Client client;

  RemoteDataMealImpl(this.client);

  @override
  Future<List<MealModel>> getAllMeals(String strCategory) async {
    final response = await client.get(Uri.parse('$allMeals$strCategory'));
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final mealsList = decodedJson['meals'] as List;
      final List<MealModel> mealModels = mealsList
          .map<MealModel>((jsonMealModel) => MealModel.fromJson(jsonMealModel))
          .toList();
      return mealModels;
    } else {
      throw Exception("Failed to fetch meals");
    }
  }
}

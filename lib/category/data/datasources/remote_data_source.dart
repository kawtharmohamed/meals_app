import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meals_app/category/data/datasources/end_points.dart';
import 'package:meals_app/category/data/models/category_model.dart';
import 'package:meals_app/category/data/models/meal_model.dart';

abstract class RemoteDataSource {
  Future<List<CategoryModel>> getAllCategories();
  Future<List<MealModel>> getAllMeals(String strCategory);
  Future<MealModel> getMealById(String idMeal);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl(this.client);

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final response = await client.get(Uri.parse(allCategories));
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body)["categories"] as List;
      final List<CategoryModel> categoryModels = decodedJson
          .map<CategoryModel>((jsonCategoryModel) =>
          CategoryModel.fromJson(jsonCategoryModel))
          .toList();
      return categoryModels;
    } else {
      throw Exception("Failed to fetch categories");
    }
  }

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

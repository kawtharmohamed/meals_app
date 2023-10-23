import 'dart:convert';
import 'dart:developer';
import 'package:meals_app/category/data/datasources/end_points.dart';
import 'package:meals_app/category/data/models/category_model.dart';
import 'package:meals_app/category/data/models/meal_model.dart';

import 'package:http/http.dart' as http;

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
    try {
      final response = await client.get(
        Uri.parse(allCategories),
      );
      log(response.body);
      //  log(response.body);
      if (response.statusCode == 200) {
        if (response.body != null) {
          final List decodedJson =
              json.decode(response.body)["categories"] as List;
          final List<CategoryModel> categoryModels = decodedJson
              .map<CategoryModel>((jsonCategoryModel) =>
                  CategoryModel.fromJson(jsonCategoryModel))
              .toList();
          return categoryModels;
        }
      }
      throw Exception();
    } catch (e) {
      print(e);
      throw Exception("An error occurred while fetching data.");
    }
  }

  @override
  Future<List<MealModel>> getAllMeals(String strCategory) async {
    try {
      final response = await client.get(Uri.parse('$allMeals$strCategory')
          //  ("https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood")
          );
      //  print('$allMeals$strCategory');
      // log(response.body);
      if (response.statusCode == 200) {
        if (response.body != null) {
          final Map<String, dynamic> decodedJson = json.decode(response.body);
          final List<dynamic>? mealsList =
              decodedJson['meals'] as List<dynamic>?;
          if (mealsList != null) {
            final List<MealModel> mealModels = mealsList
                .map<MealModel>(
                    (jsonMealModel) => MealModel.fromJson(jsonMealModel))
                .toList();
            return mealModels;
          }
        }
      }
      throw Exception();
    } catch (e) {
      print(e);
      throw Exception("An error occurred while fetching data.");
    }
  }

  Future<MealModel> getMealById(String idMeal) async {
    try {
      final response = await client.get(Uri.parse('$mealById$idMeal'));
     // log(response.body);
     print('$mealById$idMeal');
      if (response.statusCode == 200) {
        if (response.body != null) {
          final decodedJson = json.decode(response.body) as Map<String, dynamic>;
          final MealModel mealDetailModel = MealModel.fromJson(decodedJson);
          return mealDetailModel;
        }
      }
      throw Exception();
    } catch (e) {
      throw Exception("An error occurred while fetching data.");
    }
  }

}

 import 'dart:convert';
import 'package:meals_app/category/data/datasources/end_points.dart';
import 'package:meals_app/category/data/models/category_model.dart';
import 'package:meals_app/category/data/models/meal_model.dart';

import 'package:http/http.dart' as http;
abstract class RemoteDataSource{
   Future<List<CategoryModel>> getAllCategories();
   Future<List<MealModel>> getAllMeals(String strCategory);
   Future <MealModel> getMealById(int idMeal);
}
class RemoteDataSourceImpl extends RemoteDataSource{
  final http.Client client;

  RemoteDataSourceImpl(this.client);
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await client.get(Uri.parse(allCategories),);
      if (response.statusCode == 200) {
        if (response.body != null) {
          final List decodedJson = json.decode(response.body) as List;
          final List<CategoryModel> categoryModels = decodedJson
              .map<CategoryModel>((jsonCategoryModel) =>
              CategoryModel.fromJson(jsonCategoryModel))
              .toList();
          return categoryModels;
        }
      }
      throw Exception();
    } catch (e) {
      throw Exception("No internet connection. Please check your network.");
    }
  }

  @override
  Future<List<MealModel>> getAllMeals(String strCategory) async {
    try {
      final response = await client.get(Uri.parse(allMeals + strCategory ), );
      if (response.statusCode == 200) {
        if (response.body != null) {
          final List decodedJson = json.decode(response.body) as List;
          final List<MealModel> mealModels = decodedJson.map<MealModel>((
              jsonMealModel) => MealModel.fromJson(jsonMealModel)).toList();
          return mealModels;
        }
      }
      throw Exception();
    } catch (e){
      throw Exception("No internet connection. Please check your network.");
    }
  }

  @override
  Future<MealModel> getMealById(int idMeal) async {
    try {
      final response = await client.get(Uri.parse("$mealById+$idMeal"));
      if (response.statusCode == 200) {
        if (response.body != null) {
          final decodedJson = json.decode(response.body) as Map<String, dynamic>;
          final MealModel mealDetailModel = MealModel.fromJson(decodedJson);
          return mealDetailModel;
        }
      }
      throw Exception();
    } catch (e){
      throw Exception("No internet connection. Please check your network.");
    }
  }


}
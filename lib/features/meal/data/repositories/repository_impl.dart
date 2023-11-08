import 'package:dartz/dartz.dart';
import 'package:meals_app/features/meal/data/datasources/remote_data_meal.dart';
import 'package:meals_app/features/meal/domain/repositories/repository.dart';
import '../../../../core/network/network.dart';

import '../../../../core/sqflite/sqf.dart';
import '../../domain/entities/meal.dart';
import '../models/meal_model.dart';

class MealRepositoryImpl implements MealRepository {
  final RemoteDataMeal remoteDataMeal;
  final Network network;
  SqlDB sql = SqlDB();

  MealRepositoryImpl(this.remoteDataMeal, this.network);

  @override
  Future<List<Meal>> getAllMeals(String strCategory) async {
    if (await network.isConnected()) {
      final remoteMeal = await remoteDataMeal.getAllMeals(strCategory);
      return remoteMeal.map((e) => e.toEntity()).toList();
    } else {
      throw Exception();
    }
  }

  @override
  Future <Unit> deleteData(String mealId) async {
     await sql.deleteData("meals", mealId);
     return unit;
  }

  @override
  Future <Unit> insertData(Meal meal) async{
   await sql.insertData("meals",
     {
       "name": "${meal.strMeal ??''}",
       "image": "${meal.strMealThumb ??''}",
       "idMeal" :"${meal.idMeal??''}"
     }
    );
    return unit;
  }


  @override
  Future<List<Meal>> readData() async {
    var data = await sql.readData("meals");
    return data.map((e) => e.toEntity()).toList();
  }
}

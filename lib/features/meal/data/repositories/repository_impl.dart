import 'package:meals_app/features/meal/data/datasources/remote_data_meal.dart';
import 'package:meals_app/features/meal/domain/repositories/repository.dart';
import '../../../../core/network/network.dart';
import '../../../../core/sqflite/sqf.dart';
import '../../domain/entities/meal.dart';

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
  Future<List<Meal>> deleteData(String mealId) async {
    await sql.deleteData("meals", mealId);
    return await readData();
  }
  @override
  Future<void> insertData(Meal meal) async {
    await sql.insertData("meals", {
      "strMeal": meal.strMeal ?? '',
      "strMealThumb": meal.strMealThumb ?? '',
      "idMeal": meal.idMeal ?? ''
    });

  //  return await getAllMeals(meal.strCategory??'');
  }



  @override
  Future<List<Meal>> readData() async {
    var data = await sql.readData("meals");
    print("$data");
    return data.map((e) => e.toEntity()).toList();
  }

}

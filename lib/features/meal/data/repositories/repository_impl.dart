import 'package:meals_app/features/meal/data/datasources/remote_data_meal.dart';
import 'package:meals_app/features/meal/domain/repositories/repository.dart';
import '../../../../core/network/network.dart';
import '../models/meal_model.dart';

class MealRepositoryImpl implements MealRepository {
  final RemoteDataMeal remoteDataMeal;
  final Network network;

  MealRepositoryImpl(this.remoteDataMeal  , this.network);

  @override
  Future<List<MealModel>> getAllMeals(String strCategory) async {
    if (await network.isConnected()) {
      final remoteMeal = await remoteDataMeal.getAllMeals(strCategory);
      return remoteMeal;
    } else {
      throw Exception();
    }
  }

}

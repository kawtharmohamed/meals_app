import 'package:meals_app/category/data/datasources/remote_data_source.dart';
import 'package:meals_app/category/data/models/category_model.dart';
import 'package:meals_app/category/data/models/meal_model.dart';
import 'package:meals_app/category/domain/repositories/categories_repositories.dart';
import '../../../core/network/network.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final Network network;

  RepositoryImpl(this.remoteDataSource  , this.network);

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    if ( await network.isConnected()) {
      final remoteCategory = await remoteDataSource.getAllCategories();
      return remoteCategory;
    } else {
      throw Exception('No internet connection');
    }
  }

  @override
  Future<List<MealModel>> getAllMeals(String strCategory) async {
    if (await network.isConnected()) {
      final remoteMeal = await remoteDataSource.getAllMeals(strCategory);
      return remoteMeal;
    } else {
      throw Exception('No internet connection');
    }
  }

  @override
  Future<MealModel> getMealById(String idMeal) async {
    if ( await network.isConnected()) {
      final remoteDetailMeal = await remoteDataSource.getMealById(idMeal);
      return remoteDetailMeal;
    } else {
      throw Exception('No internet connection');
    }
  }
}

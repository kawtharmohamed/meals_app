import 'package:meals_app/category/data/datasources/remote_data_source.dart';
import 'package:meals_app/category/data/models/category_model.dart';
import 'package:meals_app/category/data/models/meal_model.dart';
import 'package:meals_app/category/domain/repositories/categories_repositories.dart';

class RepositoryImpl implements Repository{
  final RemoteDataSource remoteDataSource;

  RepositoryImpl(this.remoteDataSource);
  @override
  Future<List<CategoryModel>> getAllCategories() async {
     final remoteCategory= await remoteDataSource.getAllCategories();
     return remoteCategory;
  }

  @override
  Future<List<MealModel>> getAllMeals(String strCategory) async{
    final remoteMeal= await remoteDataSource.getAllMeals(strCategory);
    return remoteMeal;
    
  }

  @override
  Future<MealModel> getMealById(String idMeal)async  {
     final remoteDetailMeal = await remoteDataSource.getMealById(idMeal);
     return remoteDetailMeal;
  }


}
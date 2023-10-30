import 'package:get_it/get_it.dart';
import 'package:meals_app/category/data/datasources/remote_data_source.dart';
import 'package:meals_app/category/data/repositories/repository_impl.dart';
import 'package:meals_app/category/domain/repositories/categories_repositories.dart';
import 'package:meals_app/category/domain/usecases/get_all_categories.dart';
import 'package:meals_app/category/domain/usecases/get_all_meals.dart';
import 'package:meals_app/category/domain/usecases/get_meal_by_id.dart';
import 'package:meals_app/category/prsentation/bloc/category/category_bloc.dart';
import 'package:meals_app/category/prsentation/bloc/category/meal_bloc.dart';
import 'package:meals_app/category/prsentation/bloc/category/meal_detail_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/core/network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
final sl =GetIt.instance;
Future <void> init () async {
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(sl() , sl()));
  sl.registerFactory(() =>CategoriesBloc(getAllCategories: sl()));
  sl.registerFactory(() => MealsBloc(getAllMeals: sl()));
  sl.registerFactory(() => MealsDetailBloc(getMealById: sl(),));
  sl.registerLazySingleton(() => GetAllCategoriesUsecase(sl()));
  sl.registerLazySingleton(() => GetAllMealsUsecase(sl()));
  sl.registerLazySingleton(() => GetMealByIdUsecase(sl()));
  sl.registerLazySingleton(() => http.Client());
  final shared = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => shared);
  sl.registerLazySingleton(() => Network());
}
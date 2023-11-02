import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/core/network/network.dart';
import 'package:meals_app/features/category/data/datasources/remote_data_category.dart';
import 'package:meals_app/features/category/data/repositories/repository_impl.dart';
import 'package:meals_app/features/meal/data/repositories/repository_impl.dart';
import 'package:meals_app/features/meal_detail/data/datasources/remote_data_meal_detail.dart';
import 'package:meals_app/features/meal_detail/domain/repositories/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/category/domain/repositories/repository.dart';
import 'features/category/domain/usecases/get_all_categories.dart';
import 'features/category/prsentation/bloc/category_bloc.dart';
import 'features/meal/data/datasources/remote_data_meal.dart';
import 'features/meal/domain/repositories/repository.dart';
import 'features/meal/domain/usecases/get_all_meals.dart';
import 'features/meal/prsentation/bloc/meal_bloc.dart';
import 'features/meal_detail/data/repositories/repository_impl.dart';
import 'features/meal_detail/domain/usecases/get_meal_by_id.dart';
import 'features/meal_detail/prsentation/bloc/meal_detail_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton<RemoteDataMealDetail>(
      () => RemoteDataMealDetailImpl(sl()));
  sl.registerLazySingleton<RemoteDataMeal>(() => RemoteDataMealImpl(sl()));
  sl.registerLazySingleton<RemoteDataCategory>(
      () => RemoteDataCategoryImpl(sl()));
  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<MealRepository>(
      () => MealRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<MealDetailRepository>(
      () => MealDetailRepositoryImpl(sl(), sl()));
  sl.registerFactory(() => CategoriesBloc(getAllCategories: sl()));
  sl.registerFactory(() => MealsBloc(getAllMeals: sl()));
  sl.registerFactory(() => MealsDetailBloc(
        getMealById: sl(),
      ));
  sl.registerLazySingleton(() => GetAllCategoriesUsecase(sl()));
  sl.registerLazySingleton(() => GetAllMealsUsecase(sl()));
  sl.registerLazySingleton(() => GetMealByIdUsecase(sl()));
  sl.registerLazySingleton(() => http.Client());
  final shared = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => shared);
  sl.registerLazySingleton(() => Network());
}

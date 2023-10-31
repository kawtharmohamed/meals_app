import 'package:meals_app/features/meal_detail/data/datasources/remote_data_meal_detail.dart';
import 'package:meals_app/features/meal_detail/domain/repositories/repository.dart';
import '../../../../core/network/network.dart';
import '../models/meal_detail_model.dart';

class MealDetailRepositoryImpl implements MealDetailRepository {
  final RemoteDataMealDetail remoteDataMealDetail;
  final Network network;

  MealDetailRepositoryImpl(this.remoteDataMealDetail  , this.network);


  @override
  Future<MealDetailModel> getMealById(String idMeal) async {
    if ( await network.isConnected()) {
      final remoteDetailMeal = await remoteDataMealDetail.getMealById(idMeal);
      return remoteDetailMeal;
    } else {
      throw Exception();
    }
  }
}

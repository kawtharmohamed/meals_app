import 'package:meals_app/features/category/domain/repositories/repository.dart';
import '../../../../core/network/network.dart';
import '../datasources/remote_data_category.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final RemoteDataCategory remoteDataCategory;
  final Network network;

  CategoryRepositoryImpl(this.remoteDataCategory  , this.network);

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    if ( await network.isConnected()) {
      final remoteCategory = await remoteDataCategory.getAllCategories();
      return remoteCategory;
    } else {
      throw Exception();
    }
  }
}

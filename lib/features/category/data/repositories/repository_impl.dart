import 'package:meals_app/features/category/domain/repositories/repository.dart';
import '../../../../core/network/network.dart';
import '../../domain/entities/category.dart';
import '../datasources/remote_data_category.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final RemoteDataCategory remoteDataCategory;
  final Network network;

  CategoryRepositoryImpl(this.remoteDataCategory  , this.network);

  @override
  Future<List<Categoryy>> getAllCategories() async {
    if ( await network.isConnected()) {
      final remoteCategory = await remoteDataCategory.getAllCategories();
      return remoteCategory.map((e) =>e.toEntity()).toList();
    } else {
      throw Exception();
    }
  }
}

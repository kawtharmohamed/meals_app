import 'package:meals_app/category/domain/entities/category.dart';
import 'package:meals_app/category/domain/repositories/categories_repositories.dart';

import '../../data/models/category_model.dart';

class GetAllCategoriesUsecase{
   final Repository repository;

  GetAllCategoriesUsecase(this.repository);
  Future<List<CategoryModel>> call ()async{
  return await repository.getAllCategories();
}
  }

import 'package:meals_app/category/domain/repositories/repository.dart';
import '../../data/models/category_model.dart';

class GetAllCategoriesUsecase{
   final Repository repository;

  GetAllCategoriesUsecase(this.repository);
  Future<List<CategoryModel>> call ()async{
  return await repository.getAllCategories();
}
  }

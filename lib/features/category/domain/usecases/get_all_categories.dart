import 'package:meals_app/features/category/domain/repositories/repository.dart';
import '../../data/models/category_model.dart';

class GetAllCategoriesUsecase{
   final CategoryRepository categoryRepository;

  GetAllCategoriesUsecase(this.categoryRepository);
  Future<List<CategoryModel>> call ()async{
  return await categoryRepository.getAllCategories();
}
  }

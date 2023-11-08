import 'package:meals_app/features/category/domain/repositories/repository.dart';
import '../entities/category.dart';

class GetAllCategoriesUsecase{
   final CategoryRepository categoryRepository;

  GetAllCategoriesUsecase(this.categoryRepository);
  Future<List<Categoryy>> call ()async{
  return await categoryRepository.getAllCategories();
}
  }

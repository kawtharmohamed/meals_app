import '../entities/category.dart';

abstract class CategoryRepository {
  Future<List<Categoryy>> getAllCategories();
}

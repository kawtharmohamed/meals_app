import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/endpoints/end_points.dart';
import '../models/category_model.dart';

abstract class RemoteDataCategory {
  Future<List<CategoryModel>> getAllCategories();
}

class RemoteDataCategoryImpl extends RemoteDataCategory {
  final http.Client client;

  RemoteDataCategoryImpl(this.client);

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final response = await client.get(Uri.parse(allCategories));
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body)["categories"] as List;
      final List<CategoryModel> categoryModels = decodedJson
          .map<CategoryModel>((jsonCategoryModel) =>
          CategoryModel.fromJson(jsonCategoryModel))
          .toList();
      return categoryModels;
    } else {
      throw Exception("Failed to fetch categories");
    }
  }
}

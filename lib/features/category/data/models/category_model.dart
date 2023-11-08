import 'package:meals_app/features/category/domain/entities/category.dart';

class CategoryModel {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;

  CategoryModel({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      idCategory: json['idCategory'],
      strCategory: json['strCategory'],
      strCategoryThumb: json['strCategoryThumb'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCategory': idCategory,
      'strCategory': strCategory,
      'strCategoryThumb': strCategoryThumb,
    };
  }
  Categoryy toEntity (){
    return Categoryy(idCategory : idCategory , strCategory : strCategory ??"",
        strCategoryThumb : strCategoryThumb ??"");
  }
}

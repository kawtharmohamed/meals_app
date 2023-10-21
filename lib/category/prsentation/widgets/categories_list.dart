import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/category/prsentation/pages/meal_page.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/core/utils/navigate_to.dart';
import 'package:meals_app/core/utils/text.dart';

import '../../data/models/category_model.dart';
import '../../domain/entities/category.dart';

class CategoriesList extends StatelessWidget{
  final List<CategoryModel> categories;

  const CategoriesList({super.key, required this.categories });
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context , index) {
        return GestureDetector(
          onTap: navigateTo(context, MealPage(strCategory: categories[index].strCategory)),
          child: Card( elevation: 3,
            child: Column(children: [
              Image.asset(categories[index].strCategoryThumb , width: 120,
                height: 120,),
              SizedBox(height: 10),
              txt(MyColors.Black, categories[index].strCategory, 15, FontWeight.w500 , FontStyle.normal),
            ],),
          ),
        );
      },
      itemCount: categories.length,
    )
      ,);

  }

}

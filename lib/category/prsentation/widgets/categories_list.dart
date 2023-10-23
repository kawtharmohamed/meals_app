import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/core/utils/navigate_to.dart';
import 'package:meals_app/core/utils/text.dart';
import '../../data/models/category_model.dart';
import '../pages/meal_page.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;

  CategoriesList({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute
            (builder:(context)=>MealPage(strCategory: categories[index].strCategory ??"the value is null" )),),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        child: Image.network(categories[index].strCategoryThumb ??""),
                      ),
                      const SizedBox(height: 10),
                      txt(
                        MyColors.Black,
                        categories[index].strCategory ?? " ",
                        17,
                        FontWeight.w500,
                        FontStyle.normal,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}

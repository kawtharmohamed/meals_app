import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';
import '../../../../core/widgets/text.dart';
import '../../../meal/prsentation/pages/meal_page.dart';
import '../../domain/entities/category.dart';
class CategoriesList extends StatelessWidget {
  final List<Categoryy> categories;

  CategoriesList({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.82,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MealPage(
                  strCategory: categories[index].strCategory ?? "the value is null",
                ),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17.0),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 140,
                        child: Image.network(categories[index].strCategoryThumb ?? ""),
                      ),
                      const SizedBox(height: 10),
                      txt(
                        context,
                        categories[index].strCategory ?? " ",
                        18,
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
        childCount: categories.length,
      ),
    );
  }
}
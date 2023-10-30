import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/sqf.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/meal_model.dart';
import '../pages/meal_detail_page.dart';

class MealsList extends StatefulWidget {
  final List<MealModel> meals;

  const MealsList({Key? key, required this.meals}) : super(key: key);

  @override
  _MealsListState createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  List<MealModel> filteredMeals = [];
  TextEditingController searchController = TextEditingController();
  Set<int> favorites = Set<int>();
  SqlDB sql = SqlDB();
  late SharedPreferences shared;

  @override
  void initState() {
    super.initState();
    filteredMeals = widget.meals;
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    shared = await SharedPreferences.getInstance();
    loadFavorites();
  }

  void loadFavorites() {
    final List<String> favoriteIndices =
        shared.getStringList('favoriteIndices') ?? [];
    setState(() {
      favorites = favoriteIndices.map((index) => int.parse(index)).toSet();
    });
  }

  void saveFavorites() {
    final List<String> favoriteIndices =
    favorites.map((index) => index.toString()).toList();
    shared.setStringList('favoriteIndices', favoriteIndices);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 65,
            color: MyColors.darkYellow,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: MyColors.White.withOpacity(0.45),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: filterMeals,
                  decoration: InputDecoration(
                    hintText: "Find a Meal..",
                    prefixIcon: Icon(Icons.search, size: 22),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: clearSearch,
                      icon: Icon(Icons.clear, size: 22),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
              ),
              itemBuilder: (context, index) {
                final isFavorite = favorites.contains(index);

                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MealDetailPage(meal: filteredMeals[index]),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                                right: 15,
                                left: 15,
                              ),
                              child: Column(
                                children: [
                                  Image.network(
                                    filteredMeals[index].strMealThumb ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 15),
                                  ReadMoreText(
                                    filteredMeals[index].strMeal ?? '',
                                    trimLines: 2,
                                    colorClickableText: MyColors.Black,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: 'Show less',
                                    moreStyle: const TextStyle(
                                      fontSize: 15,
                                      color: MyColors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    lessStyle: const TextStyle(
                                      fontSize: 15,
                                      color: MyColors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 137.0),
                      child: Container(
                        width: 37,
                        height: 37,
                        decoration: const BoxDecoration(
                          color: MyColors.DarkGrey,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: isFavorite ? MyColors.red : MyColors.White,
                            size: 23,
                          ),
                          onPressed: () {
                            FavoriteIcon(index);
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: filteredMeals.length,
            ),
          ),
        ],
      ),
    );
  }

  void filterMeals(String searchedCharacter) {
    setState(() {
      filteredMeals = widget.meals
          .where((character) =>
          character.strMeal!.toLowerCase().startsWith(searchedCharacter))
          .toList();
    });
  }

  void clearSearch() {
    setState(() {
      searchController.clear();
      filterMeals('');
    });
  }
  void FavoriteIcon(int index) async {
    if (favorites.contains(index)) {
      favorites.remove(index);
      String? idToDelete = filteredMeals[index].idMeal??'';
        await sql.deleteData("DELETE FROM meals WHERE id = $idToDelete");
    } else {
      favorites.add(index);
      await sql.insertData('''
      INSERT INTO meals (`id`, `name`, `image`)
      VALUES (
        "${filteredMeals[index].idMeal??''}",
        "${filteredMeals[index].strMeal??''}",
        "${filteredMeals[index].strMealThumb??''}"
      )
    ''');
    }
    saveFavorites();
    setState(() {});
  }
}

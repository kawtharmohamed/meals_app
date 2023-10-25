import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/core/utils/text.dart';
import 'package:readmore/readmore.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: MyColors.darkYellow,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.White.withOpacity(0.55),
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
                childAspectRatio: 0.82,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
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
                              top: 20.0, right: 15, left: 15),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  width: 110,
                                  height: 110,
                                  child: Image.network(
                                      filteredMeals[index].strMealThumb ?? ''),
                                ),
                                const SizedBox(height: 15),
                                ReadMoreText(  filteredMeals[index].strMeal??'',
                                  trimLines: 2,
                                  colorClickableText:MyColors.Black,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Show more',
                                  trimExpandedText: 'Show less',
                                  moreStyle: TextStyle(fontSize: 15, color: MyColors.blue, fontWeight: FontWeight.bold),
                                  lessStyle: TextStyle(fontSize: 15, color: MyColors.red, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: filteredMeals.length,
            ),
          ),
        ],
      ),
    );
  }
  void initState() {
    filteredMeals = widget.meals;
    super.initState();
  }

  void filterMeals(String searchedCharacter) {
    setState(() {
      filteredMeals = widget.meals
          .where((character) =>
          character.strMeal!.toLowerCase().startsWith(searchedCharacter)).toList();
    });
  }

  void clearSearch() {
    setState(() {
      searchController.clear();
      filterMeals('');
    });
  }
}

import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:readmore/readmore.dart';
import '../../../core/utils/text.dart';
import '../../data/models/meal_model.dart';
//webview_flutter: ^4.4.1
//   webview_flutter_android: ^3.12.0
class MealDetailWidget extends StatelessWidget {
  final MealModel meal;

  const MealDetailWidget({Key? key, required this.meal}) : super(key: key);

  void _openYouTubeLink(BuildContext context, String? youtubeLink) {
    if (youtubeLink != null && youtubeLink.isNotEmpty) {

      print('Opening YouTube link: $youtubeLink');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 330,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(meal.strMealThumb ?? ""),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 45.0,
                  left: 20,
                ),
                child: Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 270.0),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 25,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          txt(MyColors.Black, meal.strMeal ?? '', 22, FontWeight.w600, FontStyle.normal),
                      const SizedBox(height: 5),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: MyColors.DarkGrey2, size: 28),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: txt(MyColors.DarkGrey, meal.strArea ?? '', 18, FontWeight.w600, FontStyle.normal),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      txt(MyColors.DarkGrey, "Instractions : ", 16, FontWeight.w600, FontStyle.normal),
                      const SizedBox(
                        height: 15,
                      ),
                      ReadMoreText(
                        meal.strInstructions ?? '',
                        trimLines: 4,
                        colorClickableText: MyColors.DarkGrey,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: TextStyle(fontSize: 15, color: MyColors.blue, fontWeight: FontWeight.bold),
                        lessStyle: TextStyle(fontSize: 15, color: MyColors.red, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      txt(MyColors.DarkGrey, "Youtube links for the recipe : ", 16, FontWeight.w600, FontStyle.normal),
                      const SizedBox(
                        height: 15,
                      ),
                          InkWell(
                            onTap: () {
                              _openYouTubeLink(context, meal.strYoutube);
                            },
                            child: Text(
                              meal.strYoutube ?? '',
                              style: const TextStyle(
                                color: MyColors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:readmore/readmore.dart';
import '../../../../core/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../meal/domain/entities/meal.dart';

class MealDetailWidget extends StatelessWidget {
  final Meal meal;

  const MealDetailWidget({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 220.0),
                child: Container(
                  height: 378,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50.0),
                    ),
                    color: isDarkMode? MyColors.Black : MyColors.White,
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
                          txt(context, meal.strMeal ?? '', 21,
                              FontWeight.w600, FontStyle.normal),
                          const SizedBox(height: 5),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: isDarkMode? MyColors.White : MyColors.Black, size: 26),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: txt(
                                    context,
                                    meal.strArea ?? '',
                                    17,
                                    FontWeight.w500,
                                    FontStyle.normal),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          txt(context, "Recipe : ", 17, FontWeight.w600,
                              FontStyle.normal),
                          const SizedBox(
                            height: 15,
                          ),
                          ReadMoreText(
                            meal.strInstructions ?? '',
                            style:  TextStyle(
                                color: isDarkMode? MyColors.White : MyColors.darkGrey, fontSize: 16),
                            trimLines: 5,
                            colorClickableText: MyColors.darkGrey,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: const TextStyle(
                                fontSize: 15,
                                color: MyColors.blue,
                                fontWeight: FontWeight.bold),
                            lessStyle: const TextStyle(
                                fontSize: 15,
                                color: MyColors.red,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          txt(context, "Way of the recipe : ", 17,
                              FontWeight.w600, FontStyle.normal),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () =>
                                launchUrl(Uri.parse(meal.strYoutube ?? '')),
                            child: Text(
                              meal.strYoutube ?? '',
                              style: const TextStyle(
                                color: MyColors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
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

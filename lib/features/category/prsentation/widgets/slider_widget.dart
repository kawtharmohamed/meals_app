import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../domain/entities/category.dart';
import '../bloc/category_bloc.dart';
import '../bloc/category_events.dart';
import '../bloc/category_states.dart';

class CarouselSliderr extends StatelessWidget {
  final List<Categoryy> categories;
  final int activeIndex;

  const CarouselSliderr({
    Key? key,
    required this.categories,
    required this.activeIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesStates>(
      builder: (context, state) {
        if (state is LoadedCategoriesState) {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 160,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    BlocProvider.of<CategoriesBloc>(context).add(SliderEvent(activeIndex: index));
                  },
                ),
                items: [
                  for (int i = 0; i <5; i++)
                    Container(
                      margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            categories[i].strCategoryThumb ?? '',
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                child: AnimatedSmoothIndicator(
                  activeIndex: state.activeIndex,
                  count: 5,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: MyColors.darkYellow,
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}


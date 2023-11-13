import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meal/prsentation/widgets/meal_item.dart';
import '../../domain/entities/meal.dart';
import '../bloc/meal_bloc.dart';
import '../bloc/meal_events.dart';

class MealsList extends StatelessWidget {
  final List<Meal> meals;

  const MealsList({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => _onRefresh(context),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 9.0,
            mainAxisSpacing: 9.0,
          ),
          itemBuilder: (context, index) {
            return MealItem(meal: meals[index]);
          },
          itemCount: meals.length,
        ),
      ),
    );
  }
  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<MealsBloc>(context).add(RefreshMealEvent());
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meal/prsentation/bloc/meal_events.dart';
import 'package:meals_app/features/meal/prsentation/widgets/fav_meal_item.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../dependency_injection.dart';
import '../bloc/meal_bloc.dart';
import '../bloc/meal_states.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocProvider<MealsBloc>(
        create: (_) => sl<MealsBloc>()
          ..add(ReadMealEvent()),
        child: BlocConsumer<MealsBloc, MealsStates>(
          listener: (context, state) {},
          builder: (context, state) {
          if (state is LoadedFavMealsState) {
              return FavMealItem(favMeals: state.favMeals,);
            }
            return const LoadingWidget();
          },
        ),
      ),
    );
  }
}

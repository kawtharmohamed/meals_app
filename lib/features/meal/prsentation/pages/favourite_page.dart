import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/features/meal/prsentation/bloc/meal_events.dart';
import 'package:meals_app/features/meal/prsentation/widgets/fav_meal_item.dart';
import '../../../../core/sqflite/sqf.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/text.dart';
import '../../../../dependency_injection.dart';
import '../bloc/fav_meals_bloc.dart';
import '../bloc/meal_bloc.dart';
import '../bloc/meal_states.dart';

class FavouritePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.White,
      body: BlocProvider<MealsBloc>(
        create: (_) => sl<MealsBloc>()
          ..add(ReadMealEvent()),
        child: BlocConsumer<MealsBloc, MealsStates>(
          listener: (context, state) {},
          builder: (context, state) {
          if (state is LoadedFavMealsState) {
              return FavMealItem();
            }
            return LoadingWidget();
          },
        ),
      ),
    );
  }
}

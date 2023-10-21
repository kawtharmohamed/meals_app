import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/category/prsentation/bloc/category/categorymeal_event.dart';
import 'package:meals_app/category/prsentation/bloc/category/categorymeal_state.dart';
import 'package:meals_app/category/prsentation/bloc/category/meal_bloc.dart';
import 'package:meals_app/category/prsentation/widgets/loading_widget.dart';
import 'package:meals_app/category/prsentation/widgets/meals_list.dart';
import 'package:meals_app/category/prsentation/widgets/message_display_widget.dart';

class MealPage extends StatelessWidget {
  final String strCategory;

  const MealPage({super.key, required this.strCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _bulidAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _bulidAppBar() => AppBar(title: const Text("Meals"));

  Widget _buildBody() =>
      BlocConsumer<MealsBloc, CategoriesMealsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingState) {
          return LoadingWidget();
        } else if (state is LoadedMealsState) {
          return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: MealsList(meals: state.meals));
        } else if (state is ErrorState) {
          return MessageDisplayWidget(message: state.message);
        }
        return LoadingWidget();
      });

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<MealsBloc>(context).add(RefreshEvent());
  }
}

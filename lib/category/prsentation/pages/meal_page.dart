import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/category/data/models/meal_model.dart';
import 'package:meals_app/category/prsentation/bloc/category/categorymeal_event.dart';
import 'package:meals_app/category/prsentation/bloc/category/categorymeal_state.dart';
import 'package:meals_app/category/prsentation/bloc/category/meal_bloc.dart';
import 'package:meals_app/category/prsentation/widgets/loading_widget.dart';
import 'package:meals_app/category/prsentation/widgets/meals_list.dart';
import 'package:meals_app/category/prsentation/widgets/message_display_widget.dart';
import '../../../core/style/colors.dart';
import '../../../core/utils/text.dart';
import '../../../dependency_injection.dart';

class MealPage extends StatefulWidget {
  final String strCategory;
  MealPage({super.key, required this.strCategory});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar( elevation: 0.0,
    title: SizedBox(
      width: 300,
      child: txt(MyColors.White, "Meals", 22, FontWeight.w500, FontStyle.normal),
    ),
  );

  Widget _buildBody() => BlocProvider<MealsBloc>(
    create: (_) =>
        sl<MealsBloc>()..add(AllMealsEvent(strCategory: widget.strCategory)),
    child: BlocConsumer<MealsBloc, CategoriesMealsStates>(
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
        }),
  );

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<MealsBloc>(context).add(RefreshEvent());
  }
}

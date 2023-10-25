import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/category/prsentation/bloc/category/categorymeal_event.dart';
import 'package:meals_app/category/prsentation/bloc/category/categorymeal_state.dart';
import 'package:meals_app/category/prsentation/bloc/category/meal_detail_bloc.dart';
import 'package:meals_app/category/prsentation/widgets/loading_widget.dart';
import 'package:meals_app/category/prsentation/widgets/meal_detail.dart';
import 'package:meals_app/category/prsentation/widgets/message_display_widget.dart';
import '../../../core/style/colors.dart';
import '../../../core/utils/text.dart';
import '../../../dependency_injection.dart';
import '../../data/models/meal_model.dart';

class MealDetailPage extends StatelessWidget {
  final MealModel meal;

  const MealDetailPage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(title: SizedBox( width: 300,
      child: txt(MyColors.White, "Meal Detail", 22, FontWeight.w500,
          FontStyle.normal)),);

  Widget _buildBody() => BlocProvider(
        create: (_) => sl<MealsDetailBloc>()
          ..add(MealByIdEvent(idMeal: meal?.idMeal ?? "")),
        child: BlocConsumer<MealsDetailBloc, CategoriesMealsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoadingState) {
                return LoadingWidget();
              } else if (state is LoadedMealsDetailState) {
                return RefreshIndicator(
                    onRefresh: () => _onRefresh(context),
                    child: MealDetailWidget(meal: state.meal));
              } else if (state is ErrorState) {
                return MessageDisplayWidget(message: state.message);
              }
              return LoadingWidget();
            }),
      );

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<MealsDetailBloc>(context).add(RefreshEvent());
  }
}

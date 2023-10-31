import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/text.dart';
import '../../../../dependency_injection.dart';
import '../../../meal/data/models/meal_model.dart';
import '../bloc/meal_detail_bloc.dart';
import '../bloc/meal_detail_events.dart';
import '../bloc/meal_detail_states.dart';
import '../widgets/meal_detail.dart';

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
    child: BlocConsumer<MealsDetailBloc, MealDetailStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ErrorState) {
          return AlertDialog(
            title: Text("No Internet Connection"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  _onRefresh(context);
                },
                child: Text("Refresh"),
              ),
            ],
          );
        } else if (state is LoadedMealsDetailState) {
          return MealDetailWidget(meal: state.meal);
        }
        return LoadingWidget();
      },
    ),
  );

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<MealsDetailBloc>(context).add(RefreshMealDetailEvent());
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/widgets/alter_dialog.dart';
import 'package:meals_app/core/widgets/snack_bar.dart';
import 'package:meals_app/features/category/prsentation/pages/home_page.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/text.dart';
import '../../../../dependency_injection.dart';
import '../bloc/meal_bloc.dart';
import '../bloc/meal_events.dart';
import '../bloc/meal_states.dart';
import '../widgets/meals_list.dart';

class MealPage extends StatelessWidget{
  final String strCategory;
  MealPage({ super.key, required this.strCategory});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        elevation: 0.0,
        title: SizedBox(
          width: 300,
          child: txt(
              MyColors.White, "Meals", 22, FontWeight.w500, FontStyle.normal),
        ),
      );

  Widget _buildBody() => BlocProvider<MealsBloc>(
        create: (_) => sl<MealsBloc>()
          ..add(AllMealsEvent(strCategory: strCategory)),
        child: BlocConsumer<MealsBloc, MealsStates>(
          listener: (context, state) {
            if (state is MessageState){
              SnackBarMessage().showSuccessSnackBar(context: context);
            }
          },
          builder: (context, state) {
            if (state is ErrorState) {
              return showDialogg(() => _onRefresh(context), () =>
                  Navigator.pop(context, MaterialPageRoute(builder: (context)=>
                      HomePage(),
                       )));
            } else if (state is LoadedMealsState) {
              return RefreshIndicator(
                  onRefresh: () => _onRefresh(context),
                  child: MealsList(meals: state.meals));
            }
            return LoadingWidget();
          },
        ),
      );

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<MealsBloc>(context).add(RefreshMealEvent());
  }
}

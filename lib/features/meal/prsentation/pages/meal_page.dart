import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/widgets/alter_dialog.dart';
import 'package:meals_app/core/widgets/snack_bar.dart';
import 'package:meals_app/features/category/prsentation/pages/home_page.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/text.dart';
import '../../../../dependency_injection.dart';
import '../../../../lang/locale_keys.g.dart';
import '../bloc/meal_bloc.dart';
import '../bloc/meal_events.dart';
import '../bloc/meal_states.dart';
import '../widgets/meals_list.dart';

class MealPage extends StatelessWidget {
  final String strCategory;
  TextEditingController searchController = TextEditingController();

  MealPage({
    super.key,
    required this.strCategory,
  });

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
            MyColors.White,
            LocaleKeys.Meals.tr(),
            22,
            FontWeight.w500,
            FontStyle.normal,
          ),
        ),
      );

  Widget _buildBody() => BlocProvider<MealsBloc>(
        create: (_) =>
            sl<MealsBloc>()..add(AllMealsEvent(strCategory: strCategory)),
        child: BlocConsumer<MealsBloc, MealsStates>(
          listener: (context, state) {
            if (state is MessageState) {
              SnackBarMessage().showSuccessSnackBar(context: context);
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 65,
                        color: MyColors.darkYellow,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              color: MyColors.White.withOpacity(0.45),
                            ),
                            child: TextField(
                              controller: searchController,
                              onChanged: (String searchedCharacter) {
                                BlocProvider.of<MealsBloc>(context).add(
                                    SearchEvent(
                                        searchedCharacter: searchedCharacter));
                              },
                              decoration: InputDecoration(
                                hintText: LocaleKeys.Find.tr(),
                                prefixIcon: Icon(Icons.search, size: 22),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  state is LoadedMealsState
                      ? MealsList(meals: state.meals)
                      : const SizedBox(),
                  state is LoadingState ? LoadingWidget() : const SizedBox(),
                  state is ErrorState
                      ? showDialogg(
                          () => _onRefresh(context),
                          () => Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              )))
                      : const SizedBox(),
                  state is AddMealState ? MealsList(meals: state.meals): const SizedBox(),
                ],
              ),
            );
          },
        ),
      );
}

Future<void> _onRefresh(BuildContext context) async {
  BlocProvider.of<MealsBloc>(context).add(RefreshMealEvent());
}

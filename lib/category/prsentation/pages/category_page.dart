import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/category/prsentation/bloc/category/category_bloc.dart';
import 'package:meals_app/category/prsentation/bloc/category/categorymeal_state.dart';
import 'package:meals_app/category/prsentation/widgets/categories_list.dart';
import '../../../core/utils/loading_widget.dart';
import '../bloc/category/categorymeal_event.dart';
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocConsumer<CategoriesBloc, CategoriesMealsStates>(
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
            } else if (state is LoadedCategoriesState) {
              return  RefreshIndicator(onRefresh:()=>
                  _onRefresh(context), child: CategoriesList(categories: state.categories));
            }
            return LoadingWidget();
          }),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<CategoriesBloc>(context).add(RefreshEvent());
  }
}

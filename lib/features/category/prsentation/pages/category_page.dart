import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/category/prsentation/bloc/category_events.dart';
import '../../../../core/widgets/alter_dialog.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../bloc/category_bloc.dart';
import '../bloc/category_states.dart';
import '../widgets/categories_list.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocConsumer<CategoriesBloc, CategoriesStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ErrorState) {
              return showDialogg(() => _onRefresh(context));
            } else if (state is LoadedCategoriesState) {
              return RefreshIndicator(
                  onRefresh: () => _onRefresh(context),
                  child: CategoriesList(categories: state.categories));
            }
            return LoadingWidget();
          }),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<CategoriesBloc>(context).add(CategoryRefreshEvent());
  }
}

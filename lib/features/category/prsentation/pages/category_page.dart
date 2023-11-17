import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/category/prsentation/bloc/category_events.dart';
import 'package:meals_app/features/category/prsentation/pages/splash_page.dart';
import 'package:meals_app/features/category/prsentation/widgets/slider_widget.dart';
import '../../../../core/widgets/alter_dialog.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../dependency_injection.dart';
import '../bloc/category_bloc.dart';
import '../bloc/category_states.dart';
import '../widgets/categories_list.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider( create: (_)=> sl<CategoriesBloc>()..add(AllCategoriesEvent()),
      child: BlocConsumer<CategoriesBloc, CategoriesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ErrorState) {
            return showDialogg(
                  () => _onRefresh(context),
                  () => Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashScreen(),
                ),
              ),
            );
          } else if (state is LoadedCategoriesState) {
            return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CarouselSliderr(
                      categories: state.categories,
                      activeIndex: state.activeIndex,
                    ),
                  ),
                  CategoriesList(categories: state.categories),
                ],
              ),
            );
          }
          return LoadingWidget();
        },
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<CategoriesBloc>(context).add(CategoryRefreshEvent());
  }
}

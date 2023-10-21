


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/category/prsentation/bloc/category/category_bloc.dart';
import 'package:meals_app/category/prsentation/bloc/category/categorymeal_event.dart';
import 'package:meals_app/category/prsentation/bloc/category/categorymeal_state.dart';
import 'package:meals_app/category/prsentation/widgets/categories_list.dart';
import 'package:meals_app/category/prsentation/widgets/loading_widget.dart';
import 'package:meals_app/category/prsentation/widgets/message_display_widget.dart';

class CategoryPage extends StatelessWidget{

  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer < CategoriesBloc , CategoriesMealsStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
    if (state is LoadingState){

    return LoadingWidget();
    } else if(state is LoadedCategoriesState){
    return RefreshIndicator( onRefresh: ()=> _onRefresh(context),
    child: CategoriesList(categories: state.categories));
    } else if(state is ErrorState){
    return MessageDisplayWidget(message: state.message);
    }
    return LoadingWidget();
    }
    );
  }
  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<CategoriesBloc>(context).add(RefreshEvent());
  }
}


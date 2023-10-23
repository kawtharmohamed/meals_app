import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/category/prsentation/bloc/category/categorymeal_event.dart';
import 'package:meals_app/category/prsentation/bloc/category/categorymeal_state.dart';
import 'package:meals_app/category/prsentation/bloc/category/meal_bloc.dart';
import 'package:meals_app/category/prsentation/widgets/loading_widget.dart';
import 'package:meals_app/category/prsentation/widgets/meals_list.dart';
import 'package:meals_app/category/prsentation/widgets/message_display_widget.dart';

import '../../../dependency_injection.dart';

class MealPage extends StatelessWidget {
  final String strCategory;
  TextEditingController search = TextEditingController();
  List fillterd_meals=[];
  MealPage({super.key, required this.strCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(title: const Text("Meals"));

  Widget _buildBody() =>
      Padding(
        padding:const EdgeInsets.all(8.0),
        child: BlocProvider<MealsBloc>(
          create:(_)=> sl<MealsBloc>()..add(AllMealsEvent(strCategory: strCategory)),
          child:  BlocConsumer<MealsBloc, CategoriesMealsStates>(
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
        ),
      );

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<MealsBloc>(context).add(RefreshEvent());
  }
}




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meals_app/category/prsentation/bloc/category/categorymeal_event.dart';
// import 'package:meals_app/category/prsentation/bloc/category/categorymeal_state.dart';
// import 'package:meals_app/category/prsentation/bloc/category/meal_bloc.dart';
// import 'package:meals_app/category/prsentation/widgets/loading_widget.dart';
// import 'package:meals_app/category/prsentation/widgets/meals_list.dart';
// import 'package:meals_app/category/prsentation/widgets/message_display_widget.dart';
//
// class MealPage extends StatelessWidget {
//   final String strCategory;
//   TextEditingController search = TextEditingController();
//   List fillterd_meals=[];
//   MealPage({super.key, required this.strCategory});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: _buildBody(),
//     );
//   }
//
//   AppBar _buildAppBar() => AppBar(title: const Text("Meals") ,
//       bottom: PreferredSize(child:Row(
//         children: [
//           IconButton(onPressed: (){}, icon: Icon(Icons.search)),
//           TextField(
//             controller: search ,
//             decoration:  InputDecoration(hintText: "Search for"),
//           ),
//         ],
//       ), preferredSize: Size.square(20)));
//

//
//   Future<void> _onRefresh(BuildContext context) async {
//     BlocProvider.of<MealsBloc>(context).add(RefreshEvent());
//   }
// }

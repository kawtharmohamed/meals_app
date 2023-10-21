import 'package:flutter/material.dart';
import 'package:meals_app/category/prsentation/pages/category_page.dart';
import 'package:meals_app/category/prsentation/pages/favourite_page.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/core/utils/text.dart';

import '../../domain/entities/category.dart';

class HomePage extends StatelessWidget{
  final List <Categoryy> categories;

  const HomePage({super.key, required this.categories});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController( length: 2,
      child: Scaffold(
        appBar: _bulidAppBar(),
        body: _buildBody(),
      ),
    );
  }
  AppBar _bulidAppBar() => AppBar(title: SizedBox( width: 300 , child:
  txt(MyColors.White, "Food Fusion", 20, FontWeight.w600, FontStyle.normal)),
    bottom: const TabBar(
    indicatorColor : MyColors.White , labelColor: MyColors.White , tabs: [
    Tab(text: "Home",icon:  Icon(Icons.home),),
    Tab(text:  "Favourites", icon:  Icon(Icons.headphones_rounded),)
  ],),);
  Widget _buildBody ()=> TabBarView(
  children: [
    CategoryPage(),
   FavouritePage(),
  ]
  );
}
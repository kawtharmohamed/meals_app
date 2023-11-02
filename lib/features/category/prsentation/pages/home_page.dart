import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';
import '../../../../core/widgets/text.dart';
import '../../../meal/prsentation/pages/favourite_page.dart';
import 'category_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _bulidAppBar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _bulidAppBar() => AppBar(
        title: SizedBox(
            width: 300,
            child: txt(MyColors.White, "Food Fusion", 22, FontWeight.w600,
                FontStyle.normal)),
        bottom: const TabBar(
          indicatorColor: MyColors.White,
          labelColor: MyColors.White,
          tabs: [
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "Favourites",
              icon: Icon(Icons.favorite),
            )
          ],
        ),
      );

  Widget _buildBody() => TabBarView(children: [
        const CategoryPage(),
        FavouritePage(),
      ]);
}

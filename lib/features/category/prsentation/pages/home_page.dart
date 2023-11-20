import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/core/widgets/alter_dialog.dart';
import 'package:meals_app/lang/locale_keys.g.dart';
import '../../../../core/cubit/theme_cubit.dart';
import '../../../../core/widgets/text.dart';
import '../../../meal/prsentation/pages/favourite_page.dart';
import 'category_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) => AppBar(
    title: SizedBox(
      width: 300,
      child: txt2(MyColors.White,  LocaleKeys.app_name.tr(), 22, FontWeight.w600, FontStyle.normal)
    ),
    bottom: TabBar(
      indicatorColor: MyColors.White,
      labelColor: MyColors.White,
      tabs: [
        Tab(
          text: LocaleKeys.categories.tr(),
          icon: Icon(Icons.home),
        ),
        Tab(
          text: LocaleKeys.Favourites.tr(),
          icon: Icon(Icons.favorite),
        )
      ],
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.dark_mode),
        onPressed: () {
          BlocProvider.of<ThemeCubit>(context).changeTheme();
        },
      ),
      IconButton(
        icon: Icon(Icons.language),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return chooseLanguageDialog(
                    () async => await context.setLocale(const Locale('en')),
                    () async => await context.setLocale(const Locale('ar')),
                    () => Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                ),
              );
            },
          );
        },
      ),
    ],
  );

  Widget _buildBody() => TabBarView(
    children: [
      const CategoryPage(),
      FavouritePage(),
    ],
  );
}


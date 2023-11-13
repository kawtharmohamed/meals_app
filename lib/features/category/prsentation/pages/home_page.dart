import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/core/widgets/alter_dialog.dart';
import 'package:meals_app/lang/locale_keys.g.dart';
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
        drawer: Drawer(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: MyColors.darkYellow,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                        trailing: IconButton(
                          icon: Icon(Icons.language,
                              color: MyColors.White, size: 27),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return showDialogg2(
                                    () async => await context.setLocale(const Locale('en')),
                                        () async => await context.setLocale(const Locale('ar')),
                                    () => Navigator.pop(context,MaterialPageRoute(builder:(context)=> HomePage())));
                              },
                            );
                          },
                        ),
                        title: txt(MyColors.White, LocaleKeys.Language.tr(), 20,
                            FontWeight.bold, FontStyle.normal)),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: SizedBox(
          width: 300,
          child: Text(
            LocaleKeys.app_name.tr(),
            style: TextStyle(
              color: MyColors.White,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
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
      );

  Widget _buildBody() => TabBarView(
        children: [
          const CategoryPage(),
          FavouritePage(),
        ],
      );
}

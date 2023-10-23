import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/category/prsentation/bloc/category/category_bloc.dart';
import 'package:meals_app/category/prsentation/bloc/category/categorymeal_event.dart';
import 'package:meals_app/category/prsentation/bloc/category/meal_bloc.dart';
import 'package:meals_app/category/prsentation/bloc/category/meal_detail_bloc.dart';
import 'package:meals_app/category/prsentation/pages/splash_page.dart';
import 'package:meals_app/core/style/app_theme.dart';
import 'dependency_injection.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(_) => sl<CategoriesBloc>()..add(AllCategoriesEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Posts App',
        home:const SplashScreen(),
        theme:appTheme,
      ),
    );
  }
}

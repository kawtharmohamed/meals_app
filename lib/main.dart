import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/style/app_theme.dart';
import 'dependency_injection.dart';
import 'features/category/prsentation/bloc/category_bloc.dart';
import 'features/category/prsentation/bloc/category_events.dart';
import 'features/category/prsentation/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => sl<CategoriesBloc>()..add(AllCategoriesEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: appTheme,
      ),
    );
  }
}

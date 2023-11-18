import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/firebase/firebase_api.dart';
import 'package:meals_app/core/style/app_theme.dart';
import 'package:meals_app/lang/codegen_loader.g.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/cubit/theme_cubit.dart';
import 'core/cubit/theme_state.dart';
import 'dependency_injection.dart';
import 'features/category/prsentation/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  await EasyLocalization.ensureInitialized();
  await init();
  runApp(
    BlocProvider(
      create: (context) => sl<ThemeCubit>()..getTheme(),
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/lang',
        assetLoader: const CodegenLoader(),
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          theme: state is ThemeChanged && state.isDark
              ? appDarkTheme
              : appLightTheme,
        );
      },
    );
  }
}

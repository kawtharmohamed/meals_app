import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/theme_cubit/sharedpref.dart';
import 'package:meals_app/core/theme_cubit/theme_state.dart';
class ThemeCubit extends Cubit<ThemeState> {
  final ThemePreferences themePreferences;
  ThemeCubit(this.themePreferences) : super(ThemeInitial());
  bool _isDark = false;
  bool get isDark => _isDark;
  void getTheme() {
    _isDark = themePreferences.getTheme();
    emit(ThemeChanged(_isDark));
  }
  void changeTheme() {
    _isDark = !_isDark;
    themePreferences.setTheme(_isDark);
    emit(ThemeChanged(_isDark));
  }
}

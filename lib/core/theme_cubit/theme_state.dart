abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeChanged extends ThemeState {
  final bool isDark;

  ThemeChanged(this.isDark);
}

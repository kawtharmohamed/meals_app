import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  final SharedPreferences shared;
  String key = 'key';

  ThemePreferences(this.shared);

  bool getTheme() {
    return shared.getBool(key) ?? false;
  }

  void setTheme(bool isDark) {
    shared.setBool(key, isDark);
  }
}

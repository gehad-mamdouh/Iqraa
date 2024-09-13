import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
  String langCode = 'en';

  changeTheme(ThemeMode themeMode) {
    appTheme = themeMode;
    notifyListeners();
  }

  changeLanguage(String code) {
    langCode=code;
    notifyListeners();
  }
}

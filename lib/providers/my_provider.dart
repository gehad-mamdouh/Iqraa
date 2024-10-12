import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
  String langCode = 'en';
  late SharedPreferences storage;

  MyProvider() {
    init();
  }

  Future<void> init() async {
    storage = await SharedPreferences.getInstance();
    bool? isLight = storage.getBool('isLight');
    bool? isEnglish = storage.getBool('isEnglish');

    appTheme = (isLight != null && isLight) ? ThemeMode.light : ThemeMode.dark;
    langCode = (isEnglish != null && isEnglish) ? 'en' : 'ar';

    notifyListeners();
  }

  changeTheme(ThemeMode themeMode) {
    appTheme = themeMode;
    notifyListeners();
    bool isLight = themeMode == ThemeMode.light;
    _saveTheme(isLight); // Save the theme preference
  }

  changeLanguage(String code) {
    langCode = code;
    notifyListeners();
    bool isEnglish = code == 'en' ? true : false;
    _saveLang(isEnglish);
  }

  void _saveTheme(bool isLight) {
    storage.setBool('isLight', isLight);
  }

  void _saveLang(bool isEnglish) {
    storage.setBool('isEnglish', isEnglish);
  }
}

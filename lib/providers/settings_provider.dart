import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLocale = "en";
  ThemeMode currentMode = ThemeMode.light;
  bool isDarkMode() => currentMode == ThemeMode.dark;

void setCurrentMode(ThemeMode newThemeMode) {
  currentMode = newThemeMode;
  notifyListeners();
}
  void setCurrentLocale(String newLocale) {
    currentLocale = newLocale;
    notifyListeners();
  }
}
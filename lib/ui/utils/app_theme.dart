import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static const TextStyle appBArTitleTextStyle = TextStyle(
    color: AppColors.accent,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  static const TextStyle suraNameTextStyle = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 25, color: AppColors.accent);
  static const TextStyle settingsTitleTextStyle = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 25, color: AppColors.accent);
  static const TextStyle settingsOptionTextStyle = TextStyle(
      fontWeight: FontWeight.normal, fontSize: 20, color: AppColors.accent);

  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: appBArTitleTextStyle,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(size: 32),
          unselectedIconTheme: IconThemeData(size: 32)),
      scaffoldBackgroundColor: AppColors.transparent,
      textTheme: const TextTheme(
        bodySmall: suraNameTextStyle,
        bodyLarge: appBArTitleTextStyle,
      ));
  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primiaryDark,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle:
              appBArTitleTextStyle.copyWith(color: AppColors.white)),
      scaffoldBackgroundColor: AppColors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(size: 32),
          unselectedIconTheme: IconThemeData(size: 32),
          selectedItemColor: AppColors.yellow),
      textTheme: TextTheme(
          bodySmall: suraNameTextStyle.copyWith(color: Colors.white),
          bodyLarge: appBArTitleTextStyle.copyWith(color: Colors.white)));
}

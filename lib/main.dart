// ignore_for_file: must_be_immutable

import 'package:app3/providers/settings_provider.dart';
import 'package:app3/ui/screens/details/details.dart';
import 'package:app3/ui/screens/home_screen/home_screen.dart';
import 'package:app3/ui/screens/home_screen/tabs/azkar/main_zekr.dart';
import 'package:app3/ui/screens/home_screen/tabs/azkar/zekr_detail.dart';
import 'package:app3/ui/screens/home_screen/tabs/sepha_screen/sepha_screen.dart';
import 'package:app3/ui/screens/splash_screen/splash_screen.dart';
import 'package:app3/ui/utils/app_theme.dart';
import 'package:app3/ui/utils/azkar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => SettingsProvider(), child: Islami()),
  );
}

class Islami extends StatelessWidget {
  late SettingsProvider provider;

  Islami({super.key});

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale("en"), Locale("ar")],
      locale: Locale(provider.currentLocale),
      themeMode: provider.currentMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        DetailScreen.routeName: (_) => const DetailScreen(),
        SplashScreen.routeName: (_) => const SplashScreen(),
        SephaTab.routeName: (_) => const SephaTab(),
        ZekrDetail.routeName: (_) =>
            ZekrDetail(category: '', azkarjason: azkarjason),
        MainZekr.routeName: (_) => MainZekr(azkarjason: azkarjason),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

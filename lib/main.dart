import 'package:app3/ui/screens/details/details.dart';
import 'package:app3/ui/screens/home_screen/home_screen.dart';
import 'package:app3/ui/screens/home_screen/tabs/azkar/main_zekr.dart';
import 'package:app3/ui/screens/home_screen/tabs/azkar/zekr_detail.dart';
import 'package:app3/ui/screens/home_screen/tabs/sepha_screen/sepha_screen.dart';
import 'package:app3/ui/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp(const Islami());
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates:const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales:const [Locale("en"), Locale("ar")],
      locale:const Locale("en"),
      routes: {
        HomeScreen.routeName:(_) =>const HomeScreen(),
        DetailScreen.routeName:(_)=> const DetailScreen(),
        SplashScreen.routeName : (_) =>const SplashScreen(),
        SephaTab.routeName : (_) => const SephaTab(),
        ZekrDetail.routeName: (_) => const ZekrDetail(),
        MainZekr.routeName :(_) =>const MainZekr(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
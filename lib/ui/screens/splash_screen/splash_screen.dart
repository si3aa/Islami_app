import 'package:app3/providers/settings_provider.dart';
import 'package:app3/ui/screens/home_screen/home_screen.dart';
import 'package:app3/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of(context);
    return Scaffold(
        body: Image.asset(
            settingsProvider.isDarkMode()
                ? AppAssets.logoSplashScreenDark
                : AppAssets.logoSplashScreenLight,
            fit: BoxFit.fill));
  }
}

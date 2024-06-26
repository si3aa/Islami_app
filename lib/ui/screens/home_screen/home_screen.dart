import 'package:app3/providers/settings_provider.dart';
import 'package:app3/ui/screens/home_screen/tabs/ahadeth/ahadeth_screen.dart';
import 'package:app3/ui/screens/home_screen/tabs/azkar/main_zekr.dart';
import 'package:app3/ui/screens/home_screen/tabs/quran/quran_screen.dart';
import 'package:app3/ui/screens/home_screen/tabs/setting/setting.dart';
import 'package:app3/ui/screens/home_screen/tabs/sepha_screen/sepha_screen.dart';
import 'package:app3/ui/utils/app_assets.dart';
import 'package:app3/ui/utils/app_colors.dart';
import 'package:app3/ui/utils/azkar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;

  List<String> title(context) {
    return [
      AppLocalizations.of(context)!.quran,
      AppLocalizations.of(context)!.ahadeth,
      AppLocalizations.of(context)!.sebha,
      AppLocalizations.of(context)!.azkar,
      AppLocalizations.of(context)!.settings,
    ];
  }

  List<Widget> tabs = [
    const QuranTab(),
    const AhadethTab(),
    const SephaTab(),
    MainZekr(
      azkarjason: azkarjason,
    ),
    const SettingTAb(),
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.isDarkMode()
                  ? AppAssets.backgroundDark
                  : AppAssets.backGroundLight),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title(context)[currentTabIndex],
          ),
        ),
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: buildBottomNavigationBar(),
        body: tabs[currentTabIndex],
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          currentIndex: currentTabIndex,
          onTap: (index) {
            currentTabIndex = index;
            setState(() {});
          },
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppAssets.icQuran)),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppAssets.ichadeth)),
                label: AppLocalizations.of(context)!.ahadeth),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppAssets.icSebha)),
                label: AppLocalizations.of(context)!.sebha),
            BottomNavigationBarItem(
                icon: const Icon(Icons.list),
                label: AppLocalizations.of(context)!.azkar),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings),
          ],
        ),
      );
}

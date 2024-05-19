import 'package:app3/ui/screens/home_screen/tabs/ahadeth/ahadeth_screen.dart';
import 'package:app3/ui/screens/home_screen/tabs/azkar/main_zekr.dart';
import 'package:app3/ui/screens/home_screen/tabs/quran/quran_screen.dart';
import 'package:app3/ui/screens/home_screen/tabs/setting/setting.dart';
import 'package:app3/ui/screens/home_screen/tabs/sepha_screen/sepha_screen.dart';
import 'package:app3/ui/utils/app_assets.dart';
import 'package:app3/ui/utils/app_colors.dart';
import 'package:app3/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<String> title = ['Quran', 'Hadeth', 'Sepha', 'Azkar', 'Setting'];
  List<Widget> tabs = [
    const QuranTab(),
    const AhadethTab(),
    const SephaTab(),
    const MainZekr(),
    const SettingTAb(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.backGroundLight), fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: Text(
            title[currentTabIndex],
            style: AppTheme.appBArTitleTextStyle,
          ),
        ),
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: buildBottomNavigationBar(),
        body: tabs[currentTabIndex],
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
        data: ThemeData(canvasColor: AppColors.primary),
        child: BottomNavigationBar(
          currentIndex: currentTabIndex,
          onTap: (index) {
            currentTabIndex = index;
            setState(() {});
          },
          selectedItemColor: AppColors.accent,
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icQuran)), label: 'Quran'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.ichadeth)),
                label: 'Hadeth'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: 'Sebha'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Azkar'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Setting'),
          ],
        ),
      );
}

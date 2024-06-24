import 'package:app3/providers/settings_provider.dart';
import 'package:app3/ui/screens/home_screen/tabs/azkar/zekr_component.dart';
import 'package:app3/ui/utils/app_assets.dart';
import 'package:app3/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ZekrDetail extends StatelessWidget {
  const ZekrDetail({super.key});
  static String routeName = 'title';
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(settingsProvider.isDarkMode()
                ? AppAssets.backgroundDark
                : AppAssets.backGroundLight),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: settingsProvider.isDarkMode()
                ? AppColors.white
                : AppColors.accent,
          ),
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: Text(
            selectedTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: settingsProvider.isDarkMode()
                  ? AppColors.white
                  : AppColors.accent,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: filteredAzkarList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredAzkarList[index]['zekr']));
            }),
      ),
    );
  }
}

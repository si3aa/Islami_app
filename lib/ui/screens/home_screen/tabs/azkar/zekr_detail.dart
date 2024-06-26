import 'package:app3/providers/settings_provider.dart';
import 'package:app3/ui/utils/app_assets.dart';
import 'package:app3/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ZekrDetail extends StatefulWidget {
  final String category;
  final List<Map<String, dynamic>> azkarjason;
  const ZekrDetail(
      {super.key, required this.category, required this.azkarjason});
  static String routeName = 'title';

  @override
  State<ZekrDetail> createState() => _ZekrDetailState();
}

class _ZekrDetailState extends State<ZekrDetail> {
  int countNum = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredAzkarList =
        widget.azkarjason.where((zekr) {
      return zekr['category'] == widget.category;
    }).toList();
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
            widget.category,
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
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  filteredAzkarList[index]['zekr'],
                  textAlign: TextAlign.center,
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: settingsProvider.isDarkMode()
                        ? AppColors.white
                        : AppColors.accent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(),
                Text(filteredAzkarList[index]['reference'],
                    style: TextStyle(
                      color: settingsProvider.isDarkMode()
                          ? AppColors.white
                          : AppColors.accent,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    )),
                IconButton(
                  onPressed: () {
                    Text(
                      filteredAzkarList[index]['description'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: settingsProvider.isDarkMode()
                            ? AppColors.white
                            : AppColors.accent,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.edit,
                    color: settingsProvider.isDarkMode()
                        ? AppColors.white
                        : AppColors.accent,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      countNum != filteredAzkarList[index]['count']
                          ? countNum++
                          : null;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    decoration: BoxDecoration(
                      color: settingsProvider.isDarkMode()
                          ? Theme.of(context)
                              .bottomNavigationBarTheme
                              .selectedItemColor
                          : Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      '${filteredAzkarList[index]['count']}/$countNum',
                      style:
                          const TextStyle(color: AppColors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

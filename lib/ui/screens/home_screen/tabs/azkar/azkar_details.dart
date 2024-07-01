import 'package:flutter/material.dart';
import 'package:app3/providers/settings_provider.dart';
import 'package:app3/ui/utils/app_assets.dart';
import 'package:app3/ui/utils/app_colors.dart';
import 'package:app3/ui/utils/azkar.dart';
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
  Map<int, int> currentCounts = {};
  List<bool>? isButtonEnabled;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < azkarjason.length; i++) {
      currentCounts[i] = 0;
    }
  }

  void handleButtonPress(int index) {
    setState(() {
      currentCounts[index] = (currentCounts[index] ?? 0) + 1;
      if (currentCounts[index].toString() == azkarjason[index]['count']) {
        currentCounts[index] =
            int.parse(azkarjason[index]['count']!); // Ensure it matches exactly
      }
    });
  }

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
            bool isButtonEnabled =
                currentCounts[index].toString() != azkarjason[index]['count'];
            bool hasDescription =
                azkarjason[index]['description'].toString().isNotEmpty;
            return GestureDetector(
              onTap: isButtonEnabled ? () => handleButtonPress(index) : null,
              child: Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: index == 0
                        ? const Radius.circular(20.0)
                        : const Radius.circular(15.0),
                    topRight: index == 0
                        ? const Radius.circular(20.0)
                        : const Radius.circular(15.0),
                    bottomLeft: index == filteredAzkarList.length - 1
                        ? const Radius.circular(20.0)
                        : const Radius.circular(15.0),
                    bottomRight: index == filteredAzkarList.length - 1
                        ? const Radius.circular(20.0)
                        : const Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      filteredAzkarList[index]['zekr'],
                      textAlign: TextAlign.center,
                      maxLines: 30,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(),
                    Text(
                      filteredAzkarList[index]['reference'],
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (hasDescription)
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (ctx) {
                                    return Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(16),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20))),
                                      child: Text(
                                        azkarjason[index]['description']!,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    );
                                  });
                            },
                            icon: Icon(
                              Icons.info,
                              color: settingsProvider.isDarkMode()
                                  ? AppColors.white
                                  : AppColors.accent,
                            ),
                          ),
                        Spacer(flex: hasDescription ? 2 : 1),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: settingsProvider.isDarkMode()
                                ? Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedItemColor
                                : Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${azkarjason[index]['count']}/${currentCounts[index]}',
                            style: const TextStyle(
                                color: AppColors.white, fontSize: 20),
                          ),
                        ),
                        Spacer(flex: hasDescription ? 3 : 1),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

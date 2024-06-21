import 'package:app3/model/sura_details_arguments.dart';
import 'package:app3/providers/settings_provider.dart';
import 'package:app3/ui/utils/app_assets.dart';
import 'package:app3/ui/utils/app_colors.dart';
import 'package:app3/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  static String routeName = 'details_screen';
  const DetailScreen({super.key});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late SuraDetailsArguments arguments;

  String fileContent = '';

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of(context);
    arguments =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArguments;
    if (fileContent.isEmpty) readFile();
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
            color:settingsProvider.isDarkMode()? AppColors.white:AppColors.accent, 
          ),
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: Text(
            arguments.suraOrHadethName,
            style: AppTheme.appBArTitleTextStyle,
          ),
        ),
        backgroundColor: AppColors.transparent,
        body: fileContent.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Text(
                    fileContent,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
      ),
    );
  }

  void readFile() async {
    String file = await rootBundle.loadString(arguments.isQuranFile
        ? 'assets/files/quran/${arguments.fileName}'
        : 'assets/files/ahadeth/${arguments.fileName}');
    fileContent = file;

    List<String> fileLines = file.split('\n');
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += arguments.isQuranFile ? "(${i + 1})" : '';
    }
    fileContent = fileLines.join();
    setState(() {});
  }
}

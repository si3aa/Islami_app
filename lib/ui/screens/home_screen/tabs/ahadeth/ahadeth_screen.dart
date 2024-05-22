import 'package:app3/model/sura_details_arguments.dart';
import 'package:app3/providers/settings_provider.dart';
import 'package:app3/ui/screens/details/details.dart';
import 'package:app3/ui/utils/app_assets.dart';
import 'package:app3/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of(context);
    List<String> hadethNames = List.generate(50, (index) {
      return "${index + 1}الحديث رقم ";
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(AppAssets.hadethScreenLogo),
        ),
        Divider(
            thickness: 3,
            color: settingsProvider.isDarkMode()
                ? AppColors.yellow
                : AppColors.primary),
        Text(
          AppLocalizations.of(context)!.hadethName,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        Divider(
          thickness: 3,
          color: settingsProvider.isDarkMode()
              ? AppColors.yellow
              : AppColors.primary,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            itemCount: hadethNames.length,
            itemBuilder: (_, index) {
              return TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    DetailScreen.routeName,
                    arguments: SuraDetailsArguments(
                        fileName: 'h${index + 1}.txt',
                        suraOrHadethName: hadethNames[index],
                        isQuranFile: false),
                  );
                },
                child: Text(
                  hadethNames[index],
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

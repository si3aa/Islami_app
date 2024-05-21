import 'package:app3/model/sura_details_arguments.dart';
import 'package:app3/ui/screens/details/details.dart';
import 'package:app3/ui/utils/app_assets.dart';
import 'package:app3/ui/utils/app_colors.dart';
import 'package:app3/ui/utils/app_theme.dart';
import 'package:app3/ui/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(AppAssets.quranScreenLogo),
        ),
        const Divider(),
        Text(
          AppLocalizations.of(context)!.suraName,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const Divider(
          thickness: 3,
          color: AppColors.primary,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            itemCount: Constants.suraNAme.length,
            itemBuilder: (_, index) {
              return TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, DetailScreen.routeName,
                      arguments: SuraDetailsArguments(
                          fileName: '${index + 1}.txt',
                          suraOrHadethName: Constants.suraNAme[index],
                          isQuranFile: true));
                },
                child: Text(
                  'سورة ${Constants.suraNAme[index]}',
                  style: AppTheme.suraNameTextStyle
                      .copyWith(fontWeight: FontWeight.normal),
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

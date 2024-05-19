import 'package:app3/model/sura_details_arguments.dart';
import 'package:app3/ui/screens/details/details.dart';
import 'package:app3/ui/utils/app_assets.dart';
import 'package:app3/ui/utils/app_colors.dart';
import 'package:app3/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> hadethNames = List.generate(50,(index){
      return "${index+1}الحديث رقم ";
    });
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(AppAssets.hadethScreenLogo),
          ),
          const Divider(
            thickness: 3,
            color: AppColors.primary,
          ),
          const Text(
            'HadethName',
            style: AppTheme.suraNameTextStyle,
            textAlign: TextAlign.center,
          ),
          const Divider(
            thickness: 3,
            color: AppColors.primary,
          ),
          Expanded(
            flex: 7,
            child: ListView.builder(
              itemCount: hadethNames.length,
              itemBuilder: (_, index) {
                return TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DetailScreen.routeName,
                        arguments: SuraDetailsArguments(
                            fileName: 'h${index + 1}.txt',
                            suraOrHadethName:  hadethNames[index],
                            isQuranFile: false));
                  },
                  child: Text(
                   hadethNames[index] ,
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

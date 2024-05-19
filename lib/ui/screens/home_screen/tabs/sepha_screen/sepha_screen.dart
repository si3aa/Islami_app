import 'package:app3/ui/utils/app_assets.dart';
import 'package:app3/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SephaTab extends StatefulWidget {
  const SephaTab({super.key});
  static String routeName = 'sepha';

  @override
  State<SephaTab> createState() => _SephaTabState();
}

class _SephaTabState extends State<SephaTab> {
  double rotationAngle = 0.0;
  int counter = 0;
  List<String> allText = [
    "سُبْحَانَ اللَّهِ",
    "الْحَمْدُ لِلَّه",
    "لَا إِلَهَ إِلَّا اللَّهُِ",
    "الْلَّهُ أَكْبَرُِ",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
    "سُبْحَانَ اللَّهِ الْعَظِيمِ",
    "لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ",
    "أستغفر الله",
  ];
  int indexOfAllText = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              rotationAngle += 10;
              counter++;
              if (counter % 30 == 0) {
                counter = 0;
                indexOfAllText++;
                if (indexOfAllText == allText.length) {
                  indexOfAllText = 0;
                }
              }
              setState(() {});
            },
            child: Transform.rotate(
              angle: rotationAngle * (3.14159265359 / 180),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(AppAssets.headSebhaLogoDefault),
                  SizedBox(
                    height: 370,
                    child: Image.asset(AppAssets.bodySebhaLogoDefault),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primary),
            child: Text(
              allText[indexOfAllText],
              style: const TextStyle(color: AppColors.white, fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "$counter",
              style: const TextStyle(color: AppColors.white, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}

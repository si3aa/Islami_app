import 'package:app3/ui/screens/home_screen/tabs/azkar/zekr_detail.dart';
import 'package:app3/ui/utils/azkar.dart';
import 'package:flutter/material.dart';

class MainZekr extends StatelessWidget {
  const MainZekr({super.key});
  static String routeName = 'zekr';

  @override
  Widget build(BuildContext context) {
    var zekrCategoryTitle = azkarjason
        .map((zekrTitle) => zekrTitle['category'])
        .toList()
        .toSet()
        .toList();

    return ListView.builder(
      itemCount: zekrCategoryTitle.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(bottom: 4),
              height: 45,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: index == 0
                      ? const Radius.circular(50.0)
                      : const Radius.circular(15.0),
                  topRight: index == 0
                      ? const Radius.circular(50.0)
                      : const Radius.circular(15.0),
                  bottomLeft: index == zekrCategoryTitle.length - 1
                      ? const Radius.circular(50.0)
                      : const Radius.circular(15.0),
                  bottomRight: index == zekrCategoryTitle.length - 1
                      ? const Radius.circular(50.0)
                      : const Radius.circular(15.0),
                ),
              ),
              child: Center(
                child: Text(
                  '${zekrCategoryTitle[index]}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,ZekrDetail.routeName
              );
            },
          ),
        );
      },
    );
  }
}

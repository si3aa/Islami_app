import 'package:app3/ui/screens/home_screen/tabs/azkar/zekr_component.dart';
import 'package:flutter/material.dart';

class ShowZekrItems extends StatefulWidget {
  const ShowZekrItems({super.key});

  @override
  State<ShowZekrItems> createState() => _ZekrItemsState();
}

class _ZekrItemsState extends State<ShowZekrItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.blue
          ,child: Text(
            ZekrComponent.zekr!
          ),
        )
      ],
    );
  }
}

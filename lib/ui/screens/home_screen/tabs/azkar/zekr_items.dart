import 'package:flutter/material.dart';

class ZekrItems extends StatefulWidget {
  const ZekrItems({super.key});

  @override
  State<ZekrItems> createState() => _ZekrItemsState();
}

class _ZekrItemsState extends State<ZekrItems> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: const Center(
        child: Text("Zekr Items"),
      ),
    );
  }
}

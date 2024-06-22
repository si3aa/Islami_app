import 'package:app3/ui/utils/azkar.dart';

class ZekrComponent {
  static String? category;
  static String? count;
  static String? description;
  static String? reference;
  static String? zekr;
}

var zekrElements = azkarjason
    .map((zekrElement) {
      ZekrComponent.category = zekrElement["category"] as String;
      ZekrComponent.count = zekrElement["count"] as String;
      ZekrComponent.description = zekrElement["description"] as String;
      ZekrComponent.reference = zekrElement["reference"] as String;
      ZekrComponent.zekr = zekrElement["zekr"] as String;
    })
    .toList()
    .toSet()
    .toList();

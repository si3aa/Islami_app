import 'package:app3/ui/utils/azkar.dart';
var zekrCategory = azkarjason
    .map((zekrTitle) => zekrTitle['category'])
    .toSet()
    .toList();



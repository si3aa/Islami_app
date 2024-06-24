import 'package:app3/ui/utils/azkar.dart';

List<Map<String, dynamic>> filteredAzkarList = azkarjason.where((zekr) {
  return zekr['category'] == selectedTitle;
}).toList();


 var zekrCategoryTitle = azkarjason
        .map((zekrTitle) => zekrTitle['category'])
        .toList()
        .toSet()
        .toList();

var selectedTitle = '';
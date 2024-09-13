import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SuraDetailsProvider extends ChangeNotifier{
  List<String> verses=[];
  loadSuraFile(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = sura.trim().split('\n');
    verses = suraLines;
    print(suraLines);
    notifyListeners();
  }
}
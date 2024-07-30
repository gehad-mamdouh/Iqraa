import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routName = 'suraDetails';

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(model.index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main_bg1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(size: 30),
          backgroundColor: Colors.transparent,
          title: Text(
            model.name,
            style: GoogleFonts.elMessiri(
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            //color: Color(0x80b7935f),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "${verses[index]}[${index + 1}]",
                    textDirection: TextDirection.rtl, // Corrected the parameter
                    textAlign: TextAlign.center,
                    style: GoogleFonts.amiri(
                      color: Colors.black,
                      fontSize: 20,
                      wordSpacing: 3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              },
              itemCount: verses.length,
            ),
          ),
        ),
      ),
    );
  }

  loadSuraFile(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = sura.split('\n');
    verses = suraLines;
    print(suraLines);
    setState(() {});
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/providers/sura_details_provider.dart';
import 'package:islami/sura_model.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatelessWidget {
  static const String routName = 'suraDetails';

  SuraDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;

    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadSuraFile(model.index),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);
        var isDarkMode = Theme.of(context).brightness == Brightness.dark;
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(isDarkMode
                  ? 'assets/images/bg_dark.png'
                  : 'assets/images/main_bg1.png'),
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
                style: GoogleFonts.amiri(color: Colors.white),
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                color: Color(0x80b7935f),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "${provider.verses[index]} [${index + 1}]",
                        textDirection: TextDirection.rtl,
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
                  itemCount: provider.verses.length,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

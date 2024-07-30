import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/hadeth_model.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'HadethScreen';

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/images/main_bg1.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            model.title,
            style: GoogleFonts.amiri(fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    model.content[index],
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.amiri(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              },
              itemCount: model.content.length,
            ),
          ),
        ),
      ),
    );
  }
}

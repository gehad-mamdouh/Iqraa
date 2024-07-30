import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/hadeth_details.dart';
import 'package:islami/hadeth_model.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/hadith_header-1.png', height: 219),
        Divider(
          thickness: 3,
          color: Color(0xffB7935F),
        ),
        Text(
          'Ahadeth',
          textAlign: TextAlign.center,
          style:
              GoogleFonts.elMessiri(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        Divider(
          thickness: 3,
          color: Color(0xffB7935F),
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments: allAhadeth[index]);
                },
                child: Text(
                    textAlign: TextAlign.center,
                    allAhadeth[index].title,
                    style: GoogleFonts.elMessiri(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )),
              );
            },
            itemCount: allAhadeth.length,
          ),
        )
      ],
    );
  }

  loadHadethFile() {
    rootBundle.loadString('assets/files/ahadeth.txt').then((value) {
      List<String> ahadeth = value.split('#');
      for (int i = 0; i < ahadeth.length; i++) {
        String hadeth = ahadeth[i];
        List<String> HadethLines = hadeth.trim().split('\n');
        String title = HadethLines[0];
        HadethLines.removeAt(0);
        List<String> content = HadethLines;
        HadethModel hadethModel = HadethModel(title, content);
        print(title);
        allAhadeth.add(hadethModel);
        setState(() {});
      }
    });
  }
}

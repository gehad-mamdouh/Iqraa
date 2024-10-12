import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/hadeth_model.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'HadithScreen';

  const HadethDetails.HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;
    var pro = Provider.of<MyProvider>(context);
    bool isDarkMode = pro.appTheme == ThemeMode.dark;

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
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          title: Text(
            model.title,
            style: GoogleFonts.amiri(
              fontSize: 25,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            color:
                isDarkMode ? const Color(0xff141A2E) : const Color(0x80b7935f),
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
                      color: isDarkMode ? Colors.white : Colors.black,
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

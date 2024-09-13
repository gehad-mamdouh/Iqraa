import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData{
  static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
            size: 30,
            color: Colors.black
        ),
        centerTitle: true,
        titleTextStyle:GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        shadowColor: Colors.transparent
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xffB7935F),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
    dividerTheme: DividerThemeData(
      color: Color(0xffB7935F),
      thickness: 3,
    ),
    textTheme: TextTheme(
      bodyLarge:GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.elMessiri(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
    colorScheme:const ColorScheme(brightness:Brightness.light,
      primary: Color(0xffB7935F),
      onPrimary:Color(0xffB7935F) ,
      secondary: Color(0xffB7935F),
      onSecondary:Color(0xffB7935F) ,
      error: Color(0xffB7935F),
      onError:Color(0xffB7935F) ,
      background:Color(0xffB7935F) ,
      onBackground:Color(0xffB7935F) ,
      surface:Color(0xffB7935F) ,
      onSurface:Color(0xffB7935F) ,

    ),



  );
  static ThemeData darkTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
            size: 30,
            color: Colors.white
        ),
        centerTitle: true,
        titleTextStyle:GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        shadowColor: Colors.transparent
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff141A2E),
      selectedItemColor: Color(0xffFACC1D),
      unselectedItemColor: Colors.white,
    ),
    dividerTheme: DividerThemeData(
      color: Color(0xffFACC1D),
      thickness: 3,
    ),
    textTheme: TextTheme(
      bodyLarge:GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: Colors.yellow,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Colors.yellow,
      ),
      bodySmall: GoogleFonts.elMessiri(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),

  );
}
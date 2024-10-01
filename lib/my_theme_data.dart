import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color primaryColor = const Color(0xFFB7935F);
  static Color primaryDarkColor = const Color(0xFF141A2E);
  static Color blackColor = const Color(0xFF242424);
  static Color yellowColor = const Color(0xFFFACC1D);

  static ThemeData lightTheme = ThemeData(
    iconTheme: IconThemeData(color: primaryColor),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(size: 30, color: blackColor,),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(primaryColor),
            iconSize: const WidgetStatePropertyAll(50),
            overlayColor: WidgetStateColor.transparent
        )
    ),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        selectedItemColor: blackColor,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w900,
        )),
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.w700),
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
        bodySmall: GoogleFonts.elMessiri(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
        displayLarge: GoogleFonts.inder(
            fontWeight: FontWeight.w400, fontSize: 30, color: blackColor),
        displayMedium: GoogleFonts.inder(
            fontWeight: FontWeight.w400, fontSize: 28, color: blackColor)),
    dividerTheme: DividerThemeData(color: primaryColor, thickness: 3),
    cardTheme: CardTheme(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      color: const Color.fromRGBO(248, 248, 248, 30),
      elevation: 0,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.transparent)),
    ),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
  );

  static ThemeData darkTheme = ThemeData(
    iconTheme: IconThemeData(color: yellowColor),
    primaryColor: primaryDarkColor,
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(yellowColor),
            iconSize: const WidgetStatePropertyAll(50),
            overlayColor: WidgetStateColor.transparent)),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(size: 30, color: Colors.white),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryDarkColor,
        selectedItemColor: yellowColor,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w900,
        )),
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
        bodySmall: GoogleFonts.elMessiri(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        displayLarge: GoogleFonts.inder(
            fontWeight: FontWeight.w400, fontSize: 30, color: yellowColor),
        displayMedium: GoogleFonts.inder(
            fontWeight: FontWeight.w400, fontSize: 28, color: yellowColor)),
    dividerTheme: DividerThemeData(color: yellowColor, thickness: 3),
    cardTheme: CardTheme(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      color: const Color(0xff141A2E),
      elevation: 0,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.transparent)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: primaryDarkColor,
    ),

  );
}
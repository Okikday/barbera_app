import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BarberaThemes {


  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      primaryColor: const Color(0xFFD69529),
      scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.transparent,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      textTheme: GoogleFonts.sansitaTextTheme(),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.black,
        onPrimary: Color.fromARGB(255, 150, 150, 150),
        secondary: Colors.white,
        onSecondary: Color.fromARGB(95, 255, 255, 255),
        error: Colors.red,
        onError: Colors.red,
        surface: Colors.white,
        onSurface: Colors.white,
      ));


  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      primaryColor: const Color(0xFFD69529),
      scaffoldBackgroundColor: const Color(0xFF222222),
      splashColor: Colors.transparent,
      textTheme: GoogleFonts.sansitaTextTheme(),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.white,
        onPrimary: Color.fromARGB(255, 161, 161, 161),
        secondary: Colors.black,
        onSecondary: Color.fromARGB(31, 83, 80, 80),
        error: Colors.red,
        onError: Colors.red,
        surface: Colors.black,
        onSurface: Colors.black,
      ));


}

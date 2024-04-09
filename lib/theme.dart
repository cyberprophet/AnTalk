import 'package:antech/cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get theme => ThemeData(
    fontFamily: 'SpoqaHanSansNeo',
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF67A4FF),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: switch (prefs.getString('font')) {
      _ => TextTheme(
          bodyMedium: GoogleFonts.roboto(
            color: const Color(0xFF696969),
          ),
          titleLarge: GoogleFonts.roboto(
            color: const Color(0xFF696969),
          ),
          titleMedium: GoogleFonts.roboto(
            color: const Color(0xFF696969),
          ))
    });

ThemeData get darkTheme => ThemeData(
    fontFamily: 'SpoqaHanSansNeo',
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF67A4FF),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: switch (prefs.getString('font')) {
      _ => TextTheme(
          bodyMedium: GoogleFonts.roboto(
            color: const Color(0xFF696969),
          ),
          titleLarge: GoogleFonts.roboto(
            color: const Color(0xFF696969),
          ),
          titleMedium: GoogleFonts.roboto(
            color: const Color(0xFF696969),
          ))
    });

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get theme => ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      fontFamily: GoogleFonts.cuteFont().fontFamily,
      textTheme: GoogleFonts.cuteFontTextTheme(cuteFontTextTheme),
      cardColor: const Color(0xFFDCDCDC).withOpacity(0.2),
      colorScheme: const ColorScheme.light(
        outline: Color(0x7A6A0DAD),
        onPrimaryContainer: Color(0xCF800000),
        onSecondaryContainer: Color(0xCF000080),
        scrim: Color(0xCF512BD4),
      ),
      canvasColor: const Color(0xACFFFFFF),
    );

TextTheme get cuteFontTextTheme => TextTheme(
      bodySmall: GoogleFonts.cuteFont(
        fontSize: 28.sp,
        height: 1,
        color: const Color(0xFF696969),
      ),
      bodyMedium: GoogleFonts.cuteFont(
        fontSize: 28.sp,
        height: 1,
        color: const Color(0xFF696969),
      ),
      bodyLarge: GoogleFonts.cuteFont(
        fontSize: 28.sp,
        height: 1,
        color: const Color(0xFF696969),
      ),
      displayLarge: GoogleFonts.cuteFont(
        fontSize: (32 + 16).sp,
        height: 1.h,
        color: const Color(0xFF696969),
      ),
      displayMedium: GoogleFonts.cuteFont(
        fontSize: 28.sp,
        height: 1,
        color: const Color(0xFF696969),
      ),
      displaySmall: GoogleFonts.cuteFont(
        fontSize: (16 + 8).sp,
        height: .75.h,
        color: const Color(0xFF6600FF),
      ),
      labelSmall: GoogleFonts.cuteFont(
        fontSize: (8 + 4).sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xCF6600FF),
      ),
    );

ThemeData get darkTheme => ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      scaffoldBackgroundColor: const Color(0xFF000000),
      fontFamily: GoogleFonts.cuteFont().fontFamily,
      textTheme: GoogleFonts.cuteFontTextTheme(cuteFontTextDarkTheme),
      cardColor: const Color(0xFFDCDCDC).withOpacity(0.2),
      colorScheme: const ColorScheme.dark(
        outline: Color(0x7AFFD700),
        onPrimaryContainer: Color(0xCFFF0000),
        onSecondaryContainer: Color(0xCF00BFFF),
        scrim: Color(0xCFE7AE29),
      ),
      canvasColor: const Color(0xAC000000),
    );

TextTheme get cuteFontTextDarkTheme => TextTheme(
      bodySmall: GoogleFonts.cuteFont(
        fontSize: 28.sp,
        height: 1,
        color: const Color(0xFF696969),
      ),
      bodyMedium: GoogleFonts.cuteFont(
        fontSize: 28.sp,
        height: 1,
        color: const Color(0xFF696969),
      ),
      bodyLarge: GoogleFonts.cuteFont(
        fontSize: 28.sp,
        height: 1,
        color: const Color(0xFF696969),
      ),
      displayLarge: GoogleFonts.cuteFont(
        fontSize: (32 + 16).sp,
        height: 1.h,
        color: const Color(0xFFDCDCDC),
      ),
      displayMedium: GoogleFonts.cuteFont(
        fontSize: 28.sp,
        height: 1,
        color: const Color(0xFF696969),
      ),
      displaySmall: GoogleFonts.cuteFont(
        fontSize: (16 + 8).sp,
        height: .75.h,
        color: const Color(0xFFFFC200),
      ),
      labelSmall: GoogleFonts.cuteFont(
        fontSize: (8 + 4).sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xC3FFD700),
      ),
    );

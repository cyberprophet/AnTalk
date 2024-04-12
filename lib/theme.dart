import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get theme => ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFFFFFF),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      fontFamily: GoogleFonts.cuteFont().fontFamily,
      textTheme: GoogleFonts.cuteFontTextTheme(cuteFontTextTheme),
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
    );

ThemeData get darkTheme => ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF000000),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      scaffoldBackgroundColor: const Color(0xFF000000),
      fontFamily: GoogleFonts.cuteFont().fontFamily,
      textTheme: GoogleFonts.cuteFontTextTheme(cuteFontTextDarkTheme),
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
    );

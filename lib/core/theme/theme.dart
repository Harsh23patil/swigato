import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swigato/core/theme/app_pallete.dart';
import 'package:swigato/core/theme/textstyle.dart';

class AppTheme {
  static final _border = OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppPallete.authFielBackgroundColor,
      width: 0,
    ),
    borderRadius: BorderRadius.circular(10),
  );
  static final darkThemeMode = ThemeData.dark();
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.lightBackgroundColor,
    textTheme: GoogleFonts.senTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppPallete.authFielBackgroundColor,
      contentPadding: EdgeInsets.all(22),
      labelStyle: const TextStyle(
        // fontFamily: FontFamily.sen,
        fontSize: 18,
        color: AppPallete.darkHeadLine1,
      ),
      enabledBorder: _border,
      errorBorder: _border,
      focusedBorder: _border,
      disabledBorder: _border,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swigato/core/theme/app_pallete.dart';

class AppTheme {
  static final _border = OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppPallete.authFielBackgroundColor,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(10),
  );
  static const _errorBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppPallete.buttonColor,
      width: 2,
    ),
  );
  static final darkThemeMode = ThemeData.dark();
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.lightBackgroundColor,
    textTheme: GoogleFonts.senTextTheme(),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppPallete.cursorColor,
        selectionHandleColor: AppPallete.cursorColor),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppPallete.authFielBackgroundColor,
      contentPadding: const EdgeInsets.all(22),
      labelStyle: const TextStyle(
        // fontFamily: FontFamily.sen,
        fontSize: 18,
        color: AppPallete.darkHeadLine1,
      ),
      enabledBorder: _border,
      focusedBorder: _border,
      errorBorder: _errorBorder,
      focusedErrorBorder: _errorBorder,
      disabledBorder: _border,
    ),
  );
}

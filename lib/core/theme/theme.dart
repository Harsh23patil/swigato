import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swigato/core/theme/app_pallete.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark();
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.lightBackgroundColor,
    textTheme: GoogleFonts.senTextTheme(),
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightMode = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.senTextTheme(ThemeData.light().textTheme).copyWith(
    titleLarge: GoogleFonts.sen(
      textStyle: ThemeData.light().textTheme.titleLarge,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.sen(
      textStyle: ThemeData.light().textTheme.titleMedium,
      fontSize: 16,
    ),
    bodyMedium: GoogleFonts.sen(
      textStyle: ThemeData.light().textTheme.bodyMedium,
      fontSize: 13,
    ),
    bodyLarge: GoogleFonts.sen(
      textStyle: ThemeData.light().textTheme.bodyMedium,
      fontSize: 14,
    ),
  ),
);

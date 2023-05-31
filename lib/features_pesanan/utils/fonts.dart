import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

TextTheme myTextTheme = TextTheme(
  // Primary Theme
  headlineLarge: GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  headlineMedium: GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: white,
  ),
  headlineSmall: GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: black,
  ),

  // Scondary Theme
  displayLarge: GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: grey,
  ),
  displayMedium: GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),

  // Button TabBar Start
  labelLarge: GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: white,
  ),
  labelMedium: GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: grey,
  ),
  labelSmall: GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),
  // Button TabBar End

  // Text Information Card Start
  titleLarge: GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: green,
  ),
  titleMedium: GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: red,
  ),
  titleSmall: GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: orange,
  ),
  displaySmall: GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: kuning,
  ),
  bodySmall: GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: black,
  ),
  // Text Information Card End
);

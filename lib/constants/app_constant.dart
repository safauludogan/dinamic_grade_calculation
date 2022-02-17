import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const baseColor = Colors.indigo;
  static const String headText = 'Ortalama Hesapla';
  static final TextStyle headStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: baseColor);

  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle showAverageBodyStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: baseColor);

  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: baseColor);

  static const dropdownPadding = EdgeInsets.symmetric(
      horizontal: 16, vertical: 8);

  static const horizontalPadding8 = EdgeInsets.symmetric(horizontal: 8);
}

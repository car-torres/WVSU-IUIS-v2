import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalColor {
  static const Color shadeLight = Color(0xFFF9FAFA);
  static const Color accentOne = Color(0xFF0079B3);
  static const Color brand = Color(0xFF3CB1EA);
  static const Color shadeDark = Color(0xFF132033);
  static const Color gray = Color(0xFFE9EBED);
}

class GlobalFontSize {
  static var heading = GoogleFonts.signika(fontWeight: FontWeight.bold, fontSize: 30, height: 2.25);
  static var subheading = GoogleFonts.signika(fontWeight: FontWeight.bold, fontSize: 24, height: 1.2);
  static var subheading2 = GoogleFonts.signika(fontWeight: FontWeight.bold, fontSize: 18, height: 1);
  static var large = GoogleFonts.sourceSans3(fontSize: 16, height: 1.5);
  static var standard = GoogleFonts.sourceSans3(fontWeight: FontWeight.bold, fontSize: 14, height: 1.25);
  static var standard2 = GoogleFonts.sourceSans3(fontSize: 14.0, height: 1.25);
  static var button = GoogleFonts.sourceSans3(fontWeight: FontWeight.bold, fontSize: 14, height: 1.25);
  static var small = GoogleFonts.sourceSans3(fontSize: 10, height: 1);
}

class GlobalStyles {
  static var inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(style: BorderStyle.solid, color: GlobalColor.gray)
  );
}

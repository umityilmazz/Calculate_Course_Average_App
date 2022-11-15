import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class sabitler {
  static const MaterialColor anaRenk = Colors.indigo;
  static const anaPadding = EdgeInsets.symmetric(vertical: 8, horizontal: 15);

  static const Text appBarText = Text(
    "Ortalama Hesaplama",
    style: TextStyle(color: anaRenk, fontSize: 24, fontWeight: FontWeight.bold),
  );
  static const Color appBarColor = Colors.transparent;
  static final BorderRadius textFormFieldBorder = BorderRadius.circular(20);
  static final TextStyle ortalamaTextColor = TextStyle(color: anaRenk);
  static final textStyleOrtalama = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.bold, color: anaRenk);
}

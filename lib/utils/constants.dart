import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String miasLogo = 'assets/miaslogo.png';

Color mainColor = const Color(0xff22092C);

TextStyle buttonFontstyle =
    GoogleFonts.nunito(color: Colors.white, fontSize: 20);
TextStyle appbarTitlestyle =
    GoogleFonts.poppins(color: Colors.white, fontSize: 25);
TextStyle instituteNamestyle(Color color) {
  return GoogleFonts.nunito(
      fontSize: 20, color: color, fontWeight: FontWeight.bold);
}

List<Map<String, dynamic>> titlesList = [];
List<Map<String, dynamic>> linksList = [];

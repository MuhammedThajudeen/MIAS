import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// IMAGES

String miasLogo = 'assets/miaslogo.png';
String loginImage = 'assets/login_image.png';

// COLORS

Color mainColor = const Color(0xff22092C);

// TEXTSTYLES

TextStyle buttonFontstyle =
    GoogleFonts.nunito(color: Colors.white, fontSize: 20);
TextStyle noTaskContainerstyle =
    GoogleFonts.nunito(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold);  
TextStyle appbarTitlestyle =
    GoogleFonts.poppins(color: Colors.white, fontSize: 23);
TextStyle dialogboxTitlestyle(double fontsize){
  return GoogleFonts.poppins(color: Colors.black, fontSize: fontsize);
}
TextStyle instituteNamestyle(Color color) {
  return GoogleFonts.nunito(
      fontSize: 20, color: color, fontWeight: FontWeight.bold);
}


int constLoginStatus = 0;
List<Map<String, dynamic>> titlesList = [];
List<Map<String, dynamic>> linksList = [];

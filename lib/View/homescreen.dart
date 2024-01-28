import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mias/View/Subjectscreen.dart';
import 'package:mias/utils/appbar.dart';
import 'package:mias/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: constAppbar(title: 'MIAS'),
        body: Container(
          color: mainColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Wrap(
                  children: [
                    Text('Malabar ',
                        style: GoogleFonts.nunito(
                            fontSize: 20, color: Colors.white)),
                    Text('Institute of',
                        style: GoogleFonts.nunito(
                            fontSize: 20, color: Colors.red)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Wrap(
                  children: [
                    Text('Advanced ',
                        style: GoogleFonts.nunito(
                            fontSize: 20, color: Colors.red)),
                    Text('Studies',
                        style: GoogleFonts.nunito(
                            fontSize: 20, color: Colors.white)),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/subjects');
                    },
                    child: Container(
                      height: 80,
                      width: 250,
                      decoration: BoxDecoration(
                          color: const Color(0xff872341),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text('Plus One', style: buttonFontstyle)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

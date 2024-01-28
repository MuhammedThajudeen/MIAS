import 'package:flutter/material.dart';
import 'package:mias/utils/appbar.dart';
import 'package:mias/utils/constants.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: constAppbar(title: 'MIAS'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: mainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            subjectContainer('Physics',(){Navigator.pushNamed(context, '/physics');}),
            subjectContainer('Chemistry',(){Navigator.pushNamed(context, '/chemistry');}),
            subjectContainer('Maths',(){Navigator.pushNamed(context, '/maths');}),
            subjectContainer('Zoology',(){Navigator.pushNamed(context, '/zoology');}),
            subjectContainer('Botony',(){Navigator.pushNamed(context, '/botony');}),
          ],
        ),
      ),
    );
  }

  Widget subjectContainer(String text,void Function() ontap){
    return InkWell(
            onTap: ontap,
            child: Container(
              height: 80,
              width: 250,
              decoration: BoxDecoration(
                  color: const Color(0xff872341),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Text(text, style: buttonFontstyle)),
            ),
          );
  }
}

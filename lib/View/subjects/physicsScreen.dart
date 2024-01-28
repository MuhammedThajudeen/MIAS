import 'package:flutter/material.dart';
import 'package:mias/utils/appbar.dart';
import 'package:mias/utils/constants.dart';

class Physics extends StatelessWidget {
  const Physics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: constAppbar(title: 'Physics'),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: mainColor,
          child: ListView.builder(itemBuilder: (context, index){
            return subjectContainer('Chapter ${index+1}', () { Navigator.pushNamed(context, '/youtubeplayer');});
          }, itemCount: 15,),
        ),
      )
    );
  }

  Widget subjectContainer(String text,void Function() ontap){
    return Padding(
      padding: const EdgeInsets.only( left: 10, right: 10,bottom: 40),
      child: InkWell(
              onTap: ontap,
              child: Container(
                 height: 40,
                // width: 250,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white,width: 2),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(text, style: buttonFontstyle)),
              ),
            ),
    );
  }
}
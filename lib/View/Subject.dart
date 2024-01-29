// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mias/View/titleScreen.dart';
import 'package:mias/utils/appbar.dart';
import 'package:mias/utils/constants.dart';

class subjectscreen extends StatelessWidget {
  const subjectscreen({super.key, required this.subjectname, required this.chapterCount, required this.collectionName});
  final String subjectname;
  final String collectionName;
  final int chapterCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: constAppbar(title: subjectname),
      body: Container(
        // padding: const EdgeInsets.only(bottom: 60),
        height: MediaQuery.of(context).size.height,
        color: mainColor,
        child: ListView.builder(itemBuilder: (context, index){
          return subjectContainer('Chapter ${index+1}', () {
             Navigator.push(context, MaterialPageRoute(builder: (context) =>  TitleScreen(subject: collectionName, chapter: 'chapter${index+1}',)));
             });
        }, itemCount: chapterCount,),
      )
    );
  }

  Widget subjectContainer(String text,void Function() ontap){
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10,bottom: 30),
      child: InkWell(
              onTap: ontap,
              child: Container(
                 height: 50,
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
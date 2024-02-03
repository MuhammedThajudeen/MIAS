import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mias/View/Subject.dart';
import 'package:mias/utils/appbar.dart';
import 'package:mias/utils/constants.dart';

class SubjectlistScreen extends StatelessWidget {
  const SubjectlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: constAppbar(title: 'MIAS', elevation: 5),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              subjectContainer('Physics', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const subjectscreen(
                              subjectname: 'Physics',
                              chapterCount: 15, 
                              collectionName: 'physics', // collection name is chemistry because data is stored in that
                            )));
              }),
              subjectContainer('Chemistry', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const subjectscreen(
                              subjectname: 'Chemistry',
                              chapterCount: 9, 
                              collectionName: 'chemistry', // physics datas are in chemistry collection, in firebase
                            )));
              }),
              subjectContainer('Maths', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const subjectscreen(
                              subjectname: 'Maths',
                              chapterCount: 14, 
                              collectionName: 'maths',
                            )));
              }),
              subjectContainer('Zoology', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const subjectscreen(
                              subjectname: 'Zoology',
                              chapterCount: 11, 
                              collectionName: 'zoology',
                            )));
              }),
              subjectContainer('Botony', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const subjectscreen(
                              subjectname: 'Botony',
                              chapterCount: 9, 
                              collectionName: 'botony',
                            )));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget subjectContainer(String text, void Function() ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 80,
        width: 250,
        decoration: BoxDecoration(
            color: const Color(0xff872341),
            borderRadius: BorderRadius.circular(15)),
        child: Center(child: Text(text, style: buttonFontstyle)),
      ),
    );
  }
}

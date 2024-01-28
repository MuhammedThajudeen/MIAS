import 'package:flutter/material.dart';
import 'package:mias/utils/constants.dart';

AppBar constAppbar ({required String title}){
  return AppBar(
    foregroundColor: Colors.white,
    backgroundColor: mainColor,
    title: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(title,style: appbarTitlestyle,),
    ),
    elevation: 5,
  );
}
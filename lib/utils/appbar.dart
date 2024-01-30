import 'package:flutter/material.dart';
import 'package:mias/utils/constants.dart';

AppBar constAppbar ({required String title,required double elevation}){
  return AppBar(
    foregroundColor: Colors.white,
    backgroundColor: mainColor,
    title: Text(title,style: appbarTitlestyle,),
    elevation: elevation,
  );
}
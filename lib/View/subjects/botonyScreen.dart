import 'package:flutter/material.dart';
import 'package:mias/utils/appbar.dart';
import 'package:mias/utils/constants.dart';

class Botony extends StatelessWidget {
  const Botony({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: constAppbar(title: 'Botony'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: mainColor,
        child: InkWell(
              onTap: (){},
              child: Container(
                height: 30,
                // width: 250,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white,width: 2),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text('gefgewfqwefgwjegf', style: buttonFontstyle)),
              ),
            ),
      )
    );
  }
}
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:qiyamy/utils/colors.dart';

class GridItem extends StatelessWidget {
  final String hizbNumber;
  final String hizbTitle;

  const GridItem(
      {super.key, required this.hizbNumber, required this.hizbTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: fourthColor),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                hizbNumber,
                style: TextStyle(
                    fontFamily: 'Rakkas', fontSize: 30, color: mainColor),
              ),
              Text(
                hizbTitle,
                style: TextStyle(
                    fontFamily: 'ReemKufi', color: mainColor, fontSize: 16),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}

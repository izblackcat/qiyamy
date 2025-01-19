import 'package:flutter/material.dart';
import 'package:qiyamy/utils/colors.dart';

class Hizb extends StatelessWidget {
  final int number;
  final String title;

  const Hizb({super.key, required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: fourthColor),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                number.toString(),
                style: const TextStyle(
                    fontFamily: 'Rakkas', fontSize: 14, color: mainColor),
              ),
              Text(
                title,
                softWrap: true,
                style: const TextStyle(
                    fontFamily: 'ReemKufi', color: mainColor, fontSize: 10),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}

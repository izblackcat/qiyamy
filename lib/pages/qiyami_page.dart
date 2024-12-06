// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:qiyamy/utils/button.dart';
import 'package:qiyamy/utils/colors.dart';

class QiyamiPage extends StatelessWidget {
  const QiyamiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Column(
            // mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Text(
            "20 نونبر 2024",
            style:
                TextStyle(fontFamily: 'Rakkas', fontSize: 16, color: mainColor),
          ),
          Container(
            width: 110,
            height: 3,
            color: secondColor,
          ),
          SizedBox(
            height: 60,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                "لقد اخترنا لك الحزب رقم :",
                style:
                    TextStyle(fontFamily: 'ReemKufi', fontSize: 20, color: mainColor),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
                color: fourthColor, borderRadius: BorderRadius.circular(12)),
            width: 300,
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("15",
                        style: TextStyle(
                            fontFamily: 'Rakkas',
                            fontSize: 32,
                            color: mainColor)),
                    Text(
                        "ولو أننا نزلنا عليهم الملائكة وكلمهم الموتى وحشرنا عليهم كل شئ قبلا ماكانوا ليومنوا إلا أن يشاء الله ولكن أكثرهم يجهلون",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'ReemKufi',
                            fontSize: 24,
                            color: mainColor)),
                  ],
                ),
                Text("سورة الأنعام",
                    style: TextStyle(
                        fontFamily: 'Rakkas', fontSize: 20, color: mainColor)),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Button(
                buttonText: "قبول",
                buttonColor: secondColor,
              ),
              Button(
                buttonText: "تغيير",
                buttonColor: thirdColor,
              )
            ],
          )
                ],
              ),
        ]
        ));
  }
}

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qiyamy/utils/al_ahzab.dart';
import 'package:qiyamy/utils/button.dart';
import 'package:qiyamy/utils/colors.dart';
import 'package:qiyamy/utils/grid_item.dart';
import 'package:qiyamy/utils/qiyam_service.dart';

class QiyamiPage extends StatefulWidget {
  const QiyamiPage({super.key});

  @override
  State<QiyamiPage> createState() => _QiyamiPageState();
}

class _QiyamiPageState extends State<QiyamiPage> {
  Map hizbsMap = getHizbsMap();

  var qiyamService = QiyamService();

  List _choosenHizbsIndexes = [];
  int _radnomHizbNumber = 0;
  static const int max = 10;

  void _selectAHizb() {
    int randomNumber = Random().nextInt(max);

    if (_choosenHizbsIndexes.length == hizbsMap.length) {
      qiyamService.showSnackbar(
          context, "لقد تم الإنتهاء من جميع الأحزاب, سيتم البدء من جديد.");
      _choosenHizbsIndexes = [];
    }

    while (_choosenHizbsIndexes.contains(randomNumber)) {
      randomNumber = Random().nextInt(max);
    }

    setState(() {
      _radnomHizbNumber = randomNumber;
      qiyamService.showSnackbar(
          context, "تم اختيار الحزب  ${_radnomHizbNumber + 1}  تقبل الله");
    });
  }

  void _acceptChoosenHizb() {
    if (!_choosenHizbsIndexes.contains(_radnomHizbNumber)) {
      setState(() {
        _choosenHizbsIndexes.add(_radnomHizbNumber);
        qiyamService.showSnackbar(
            context, "تمت إضافة الحزب ${_radnomHizbNumber + 1}");
      });
    } else {
      qiyamService.showSnackbar(context, "تمت إضافة الحزب مسبقا !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(
        children: [
          Text(
            qiyamService.getDate(),
            style:
                TextStyle(fontFamily: 'Rakkas', fontSize: 16, color: mainColor),
          ),
          Container(
            width: 140,
            height: 3,
            color: secondColor,
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                "لقد اخترنا لك الحزب رقم :",
                style: TextStyle(
                    fontFamily: 'ReemKufi', fontSize: 20, color: mainColor),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: fourthColor, borderRadius: BorderRadius.circular(12)),
            width: 300,
            height: 330,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text((_radnomHizbNumber + 1).toString(),
                        style: TextStyle(
                            fontFamily: 'Rakkas',
                            fontSize: 32,
                            color: mainColor)),
                    Text(hizbsMap[_radnomHizbNumber + 1]['long'],
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
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                buttonText: "اختيار",
                buttonColor: thirdColor,
                onPressedFunc: _selectAHizb,
              ),
              Button(
                buttonText: "قبول",
                buttonColor: secondColor,
                onPressedFunc: _acceptChoosenHizb,
              )
            ],
          ),
          _choosenHizbsIndexes.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      height: 1,
                      color: mainColor,
                    ),
                    Text("الأحزاب التي تمت قراءتها :",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'ReemKufi',
                            fontSize: 20,
                            color: mainColor)),
                    GridView.builder(
                      padding: EdgeInsets.all(5),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount:
                          _choosenHizbsIndexes.length, // Number of grid items
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GridItem(
                        hizbNumber: hizbsMap[_choosenHizbsIndexes[index] + 1]
                                ['number']
                            .toString(),
                        hizbTitle: hizbsMap[_choosenHizbsIndexes[index] + 1]
                            ['short'],
                      ),
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    ]));
  }
}

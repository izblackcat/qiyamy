// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qiyamy/data/database.dart';

import 'package:qiyamy/utils/al_ahzab.dart';
import 'package:qiyamy/utils/button.dart';
import 'package:qiyamy/utils/colors.dart';
import 'package:qiyamy/utils/grid_item.dart';
import 'package:qiyamy/utils/qiyam_service.dart';

class QiyamPage extends StatefulWidget {
  const QiyamPage({super.key});

  @override
  State<QiyamPage> createState() => _QiyamPageState();
}

class _QiyamPageState extends State<QiyamPage> {
  Box? _alAhzabBox;

  QiyamiDatabase qiyamiDB = QiyamiDatabase();

  Map hizbsMap = getAlAhzabMap();

  var qiyamService = QiyamService();

  int _radnomHizbNumber = 0;
  static const int max = 37;

  bool isLoading = false;
  bool isHizbChoosen = false;

  @override
  void initState() {
    _alAhzabBox = Hive.box("alAhzabBox");

    if (_alAhzabBox!.get("alAhzabList") == null) {
      qiyamiDB.createInitialAhzab();
    } else {
      qiyamiDB.loadAlAhzab();
    }
    super.initState();
  }

  void _selectAHizb() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    int randomNumber = Random().nextInt(max);

    if (qiyamiDB.alAhzabList.length == hizbsMap.length) {
      qiyamService.showSnackbar(
          context, "لقد تم الإنتهاء من جميع الأحزاب, سيتم البدء من جديد.");
      // _choosenHizbsIndexes = [];
      qiyamiDB.alAhzabList = [];
      qiyamiDB.updateAlAhzab();
    }

    while (qiyamiDB.alAhzabList.contains(randomNumber)) {
      randomNumber = Random().nextInt(max);
    }

    setState(() {
      _radnomHizbNumber = randomNumber;
      isLoading = false;
      isHizbChoosen = true;
      qiyamService.showSnackbar(
          context, "تم اختيار الحزب  ${_radnomHizbNumber + 1}");
    });
  }

  void _acceptChoosenHizb() {
    if (!qiyamiDB.alAhzabList.contains(_radnomHizbNumber)) {
      setState(() {
        qiyamiDB.alAhzabList.add(_radnomHizbNumber);

        qiyamiDB.updateAlAhzab();

        print(qiyamiDB.alAhzabList.length);

        qiyamService.showSnackbar(
            context, "تمت إضافة الحزب  ${_radnomHizbNumber + 1}  تقبل الله");
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
                TextStyle(fontFamily: 'Rakkas', fontSize: 17, color: mainColor),
          ),
          Container(
            width: 150,
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
            height: 350,
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                    color: mainColor,
                  ))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text((_radnomHizbNumber + 1).toString(),
                            style: TextStyle(
                                fontFamily: 'Rakkas',
                                fontSize: 32,
                                color: mainColor)),
                      ),
                      Spacer(),
                      Flexible(
                        flex: 6,
                        fit: FlexFit.loose,
                        child: Text(hizbsMap[_radnomHizbNumber + 1]['long'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'ReemKufi',
                                fontSize: 20,
                                color: mainColor)),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 1,
                        child: Text(
                            "سورة ${hizbsMap[_radnomHizbNumber + 1]['surat']}",
                            style: TextStyle(
                                fontFamily: 'Rakkas',
                                fontSize: 18,
                                color: mainColor)),
                      ),
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
                buttonText: "اختر  لي",
                buttonColor: thirdColor,
                textColor: mainColor,
                onPressedFunc: _selectAHizb,
              ),
              Button(
                buttonText: "قبول",
                buttonColor: secondColor,
                textColor: Colors.white,
                onPressedFunc: _acceptChoosenHizb,
              )
            ],
          ),
          qiyamiDB.alAhzabList.isNotEmpty
              ? Column(
                  children: [
                    Divider(
                      color: mainColor,
                    ),
                    Text("الأحزاب التي قمت بقراءتها :",
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
                          qiyamiDB.alAhzabList.length, // Number of grid items
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GridItem(
                        hizbNumber: hizbsMap[qiyamiDB.alAhzabList[index] + 1]
                                ['number']
                            .toString(),
                        hizbTitle: hizbsMap[qiyamiDB.alAhzabList[index] + 1]
                            ['short'],
                      ),
                    ),
                  ],
                )
              : SizedBox()
        ],
      ),
    ]));
  }
}

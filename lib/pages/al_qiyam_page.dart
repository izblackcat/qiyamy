// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qiyamy/data/database.dart';

import 'package:qiyamy/utils/al_ahzab.dart';
import 'package:qiyamy/utils/button.dart';
import 'package:qiyamy/utils/colors.dart';
import 'package:qiyamy/utils/grid_item.dart';
import 'package:qiyamy/services/qiyam_service.dart';

class AlQiyamPage extends StatefulWidget {
  const AlQiyamPage({super.key});

  @override
  State<AlQiyamPage> createState() => _AlQiyamPageState();
}

class _AlQiyamPageState extends State<AlQiyamPage> {
  Box? _alAhzabBox;

  QiyamiDatabase qiyamiDB = QiyamiDatabase();

  Map hizbsMap = getAlAhzabMap();

  var qiyamService = QiyamService();

  int _radnomHizbNumber = 0;

  bool isLoading = false;
  bool isHizbChoosen = false;

  bool isQiyamAhzabEmpty = false;

  @override
  void initState() {
    _alAhzabBox = Hive.box("alAhzabBox");

    if (_alAhzabBox!.get("alAhzabList") == null) {
      qiyamiDB.createInitialAhzab();
      isQiyamAhzabEmpty = true;
    } else {
      qiyamiDB.loadAlAhzab();
      isQiyamAhzabEmpty = false;
    }
    super.initState();
  }

  void _selectAHizb() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _radnomHizbNumber = QiyamService().chooseRandomHizb(context);
      List qiyamAhzab = qiyamiDB.loadAlAhzab();
      isQiyamAhzabEmpty = qiyamAhzab.isEmpty;
      isLoading = false;
      isHizbChoosen = true;
      if (_radnomHizbNumber != 0) {
        qiyamService.showSnackbar(
            context, "تم اختيار الحزب  ${_radnomHizbNumber}");
      }
    });
  }

  void _acceptChoosenHizb() {
    List qiyamAhzab = qiyamiDB.loadAlAhzab();

    if (!qiyamAhzab.contains(_radnomHizbNumber)) {
      setState(() {
        qiyamiDB.qiyamAhzabList.add(_radnomHizbNumber);
        qiyamiDB.updateAlAhzab();
        isQiyamAhzabEmpty = qiyamiDB.qiyamAhzabList.isEmpty;
        qiyamService.showSnackbar(
            context, "تمت إضافة الحزب  ${_radnomHizbNumber}  تقبل الله");
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
                _radnomHizbNumber != 0
                    ? "لقد اخترنا لك الحزب رقم :"
                    : 'رجاءً قم بالضغط على زر "اختر لي" أسفله للبدء :',
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
                : Center(
                    child: _radnomHizbNumber == 0
                        ? qiyamService.buildShimmerPlaceholder()
                        : qiyamService.buildQiyamColumn(_radnomHizbNumber),
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
          isQiyamAhzabEmpty
              ? SizedBox()
              : Column(
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
                      itemCount: qiyamiDB
                          .qiyamAhzabList.length, // Number of grid items
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GridItem(
                        hizbNumber: hizbsMap[qiyamiDB.qiyamAhzabList[index]]
                                ['number']
                            .toString(),
                        hizbTitle: hizbsMap[qiyamiDB.qiyamAhzabList[index]]
                            ['short'],
                      ),
                    ),
                  ],
                )
        ],
      ),
    ]));
  }
}

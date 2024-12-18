import 'package:flutter/material.dart';
import 'package:qiyamy/utils/al_ahzab.dart';
import 'package:qiyamy/utils/button.dart';
import 'package:qiyamy/utils/colors.dart';
import 'package:qiyamy/utils/qiyam_service.dart';
import 'package:qiyamy/utils/wird_box.dart';

class AlWirdPage extends StatefulWidget {
  const AlWirdPage({super.key});

  @override
  State<AlWirdPage> createState() => _AlWirdPageState();
}

class _AlWirdPageState extends State<AlWirdPage> {
  final qiyamService = QiyamService();
  final alAhzabMap = getAlAhzabMap(); // starts from 1

  int _firstHizbIndex = 0;
  int _secondHizbIndex = 0;

  @override
  void initState() {
    getDailyWird();
    super.initState();
  }

  // TODO: this works, but needs to be incremented sequantially
  // because it gives the same result for day = 31 and day = 1
  void getDailyWird() {
    // int day = DateTime.now().day; // [1, 31]
    int day = 1;
    int i = (day != 30) ? day % 30 : day;
    _firstHizbIndex = 2 * i - 1;
    _secondHizbIndex = 2 * i;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(children: [
        Text(
          qiyamService.getDate(),
          style: const TextStyle(
              fontFamily: 'Rakkas', fontSize: 17, color: mainColor),
        ),
        Container(
          width: 150,
          height: 3,
          color: secondColor,
        ),
        const SizedBox(
          height: 20,
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Text(
              "وردك اليومي هو الحزبين :",
              style: TextStyle(
                  fontFamily: 'ReemKufi', fontSize: 20, color: mainColor),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        WirdBox(
            wirdNumber: alAhzabMap[_firstHizbIndex]['number'],
            wirdShortTitle: alAhzabMap[_firstHizbIndex]['short'],
            wirdSurat: alAhzabMap[_firstHizbIndex]['surat']),
        const SizedBox(
          height: 10,
        ),
        WirdBox(
            wirdNumber: alAhzabMap[_secondHizbIndex]['number'],
            wirdShortTitle: alAhzabMap[_secondHizbIndex]['short'],
            wirdSurat: alAhzabMap[_secondHizbIndex]['surat']),
        const SizedBox(
          height: 10,
        ),
        const Text("تقبل الله منكم",
            style: TextStyle(
                fontFamily: 'Rakkas', fontSize: 20, color: mainColor)),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: mainColor,
        ),
        const Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: EdgeInsets.only(right: 30.0),
                child: Text("هل أنهيت قراءة الورد؟",
                    style: TextStyle(
                        fontFamily: 'ReemKufi',
                        fontSize: 20,
                        color: mainColor)))),
        const SizedBox(
          height: 8,
        ),
        Button(
            buttonText: "نعم",
            buttonColor: secondColor,
            textColor: Colors.white,
            onPressedFunc: () {
              getDailyWird();
              // qiyamService.showSnackbar(context, "أحسنت. تقبل الله منكم");
            }),
        Button(
            buttonText: "ليس بعد",
            buttonColor: Colors.white,
            textColor: mainColor,
            onPressedFunc: () {
              qiyamService.showSnackbar(context, "وما الذي تنتظره إذا؟");
            },
            outlined: true)
      ])
    ]));
  }
}

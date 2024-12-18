import 'package:flutter/material.dart';
import 'package:qiyamy/utils/colors.dart';

class WirdBox extends StatelessWidget {
  final int wirdNumber;
  final String wirdShortTitle;
  final String wirdSurat;

  const WirdBox(
      {super.key,
      required this.wirdNumber,
      required this.wirdShortTitle,
      required this.wirdSurat});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: fourthColor, borderRadius: BorderRadius.circular(12)),
        width: 320,
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Text(wirdNumber.toString(),
                  style: const TextStyle(
                      fontFamily: 'Rakkas', fontSize: 30, color: mainColor)),
            ),
            const Spacer(),
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Text(wirdShortTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'ReemKufi', fontSize: 20, color: mainColor)),
            ),
            const Spacer(),
            Expanded(
              flex: 1,
              child: Text("سورة $wirdSurat",
                  style: const TextStyle(
                      fontFamily: 'Rakkas', fontSize: 18, color: mainColor)),
            ),
          ],
        ));
  }
}

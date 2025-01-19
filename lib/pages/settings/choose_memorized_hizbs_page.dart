// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qiyamy/services/app_bar_service.dart';
import 'package:qiyamy/services/qiyam_service.dart';
import 'package:qiyamy/utils/al_ahzab.dart';
import 'package:qiyamy/utils/button.dart';
import 'package:qiyamy/utils/colors.dart';
import 'package:qiyamy/utils/hizb.dart';
import 'package:qiyamy/utils/text_subtitle.dart';

class ChooseMemorizedHizbsPage extends StatefulWidget {
  const ChooseMemorizedHizbsPage({super.key});

  @override
  State<ChooseMemorizedHizbsPage> createState() =>
      _ChooseMemorizedHizbsPageState();
}

class _ChooseMemorizedHizbsPageState extends State<ChooseMemorizedHizbsPage> {
  Set<int> selectedHizbs = {};

  @override
  Widget build(BuildContext context) {
    final appBarService = AppBarService();

    Map alAhzab = getAlAhzabMap();

    return Scaffold(
      appBar: appBarService.getAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextSubtitle(text: ' : قم باختيار الأحزاب التي تحفظها'),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap:
                  true, // Ensures the GridView takes up only necessary space
              physics:
                  NeverScrollableScrollPhysics(), // Prevents GridView's own scrolling
              padding: EdgeInsets.all(5),
              itemCount: 60,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                bool isSelected = selectedHizbs.contains(index);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedHizbs.remove(index);
                      } else {
                        selectedHizbs.add(index);
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      Hizb(
                        number: alAhzab[index + 1]['number'],
                        title: alAhzab[index + 1]['short'],
                      ),
                      if (isSelected)
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.check_circle,
                              color: mainColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Divider(), // Spacing between GridView and button
            Button(
              buttonText: "حفظ",
              buttonColor: thirdColor,
              textColor: mainColor,
              onPressedFunc: () {
                QiyamService().setChoosenHizbs(selectedHizbs);
                Navigator.pushNamed(context, '/alqiyampage');
              },
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              buttonText: "إلغاء",
              buttonColor: Colors.white,
              textColor: mainColor,
              onPressedFunc: () {
                QiyamService().setChoosenHizbs({});
                Navigator.pushNamed(context, '/alqiyampage');
              },
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

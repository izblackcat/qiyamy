// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:qiyamy/pages/al_ahzab_tab.dart';
import 'package:qiyamy/pages/al_ajzaa_tab.dart';
import 'package:qiyamy/utils/colors.dart';

class AlAhzabPage extends StatelessWidget {
  const AlAhzabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              bottom: PreferredSize(
                  preferredSize: Size(20, 0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 200,
                      child: TabBar(
                          padding: EdgeInsets.all(4),
                          indicator: UnderlineTabIndicator(
                              borderSide:
                                  BorderSide(width: 3.0, color: secondColor),
                              insets: EdgeInsets.symmetric(horizontal: 40)),
                          dividerHeight: 0,
                          tabs: [
                            Text(
                              "الأحزاب",
                              style: TextStyle(
                                  color: mainColor,
                                  fontFamily: "ReemKufi",
                                  height: 3),
                            ),
                            Text(
                              "الأجزاء",
                              style: TextStyle(
                                  color: mainColor,
                                  fontFamily: "ReemKufi",
                                  height: 3),
                            )
                          ]),
                    ),
                  ))),
          body: TabBarView(children: [AlAhzabTab(), AlAjzaaTab()]),
        ));
  }
}

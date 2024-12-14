// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:qiyamy/pages/al_ahzab_page.dart';
import 'package:qiyamy/pages/al_wird_page.dart';
import 'package:qiyamy/pages/more_page.dart';
import 'package:qiyamy/pages/qiyam_page.dart';
import 'package:qiyamy/utils/colors.dart';
// import 'package:qiyamy/utils/grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  final List _pages = [
    AlAhzabPage(),
    QiyamPage(),
    AlWirdPage(),
    MorePage()
  ];

  void _setCurrentPageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "قيامي",
            style:
                TextStyle(fontFamily: 'Rakkas', fontSize: 45, color: mainColor),
          ),
          actions: const [
            Icon(
              Icons.more_vert_rounded,
              size: 30,
            )
          ],
        ),
          body: _pages[_currentPageIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentPageIndex,
              onTap: _setCurrentPageIndex,
              selectedItemColor: mainColor,
              selectedLabelStyle:
                  TextStyle(fontFamily: "ReemKufi", fontSize: 16),
              unselectedLabelStyle:
                  TextStyle(fontFamily: "ReemKufi", fontSize: 16),
              type: BottomNavigationBarType.fixed,
              iconSize: 30,
              items: [
                BottomNavigationBarItem(
                    tooltip: "لائحة الأحزاب والأجزاء",
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(Icons.menu_book),
                    ),
                    label: "الأحزاب"),
                BottomNavigationBarItem(
                  tooltip: "ورد قيام الليل المختار",
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(Icons.mosque),
                    ),
                    label: "القيام"),
                BottomNavigationBarItem(
                  tooltip: "ورد المراجعة اليومي",
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(Icons.local_library_sharp),
                    ),
                    label: "الورد"),
                BottomNavigationBarItem(
                  tooltip: "المزيد",
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(Icons.menu),
                    ),
                    label: "المزيد"),
              ]),
        );
  }
}
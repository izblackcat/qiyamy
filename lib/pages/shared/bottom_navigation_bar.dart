// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:qiyamy/pages/al_ahzab_page.dart';
import 'package:qiyamy/pages/al_qiyam_page.dart';
import 'package:qiyamy/pages/al_wird_page.dart';
import 'package:qiyamy/pages/more_page.dart';
import 'package:qiyamy/utils/colors.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    int _currentPageIndex = 0;

    final List _pages = [
      const AlAhzabPage(),
      const AlQiyamPage(),
      const AlWirdPage(),
      const MorePage()
    ];

    void _setCurrentPageIndex(int index) {
      setState(() {
        _currentPageIndex = index;
      });
    }

    return BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: _setCurrentPageIndex,
        selectedItemColor: mainColor,
        selectedLabelStyle:
            const TextStyle(fontFamily: "ReemKufi", fontSize: 16),
        unselectedLabelStyle:
            const TextStyle(fontFamily: "ReemKufi", fontSize: 16),
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
              tooltip: "لائحة الأحزاب والأجزاء",
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(Icons.menu_book),
              ),
              label: "الأحزاب"),
          BottomNavigationBarItem(
              tooltip: "ورد قيام الليل المختار",
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(Icons.mosque),
              ),
              label: "القيام"),
          BottomNavigationBarItem(
              tooltip: "ورد المراجعة اليومي",
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(Icons.local_library_sharp),
              ),
              label: "الورد"),
          BottomNavigationBarItem(
              tooltip: "المزيد",
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(Icons.menu),
              ),
              label: "المزيد"),
        ]);
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:qiyamy/utils/al_ahzab.dart';
import 'package:qiyamy/utils/colors.dart';
import 'package:qiyamy/utils/grid_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List alAhzab = getAlAhzabList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "قيامي",
          style:
              TextStyle(fontFamily: 'Rakkas', fontSize: 45, color: mainColor),
        ),
        actions: [
          Icon(
            Icons.more_vert_rounded,
            size: 30,
          )
        ],
      ),
      body: GridView.builder(
          itemCount: 60,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) => GridItem(
                hizbNumber: (index + 1).toString(),
                hizbTitle: alAhzab[index],
              )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: null,
          selectedItemColor: mainColor,
          selectedLabelStyle: TextStyle(fontFamily: "ReemKufi", fontSize: 16),
          unselectedLabelStyle: TextStyle(fontFamily: "ReemKufi", fontSize: 16),
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
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Icon(Icons.mosque),
                ),
                label: "القيام"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Icon(Icons.local_library_sharp),
                ),
                label: "الورد"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Icon(Icons.menu),
                ),
                label: "المزيد"),
          ]),
    );
  }
}

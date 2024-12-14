// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:qiyamy/utils/al_ahzab.dart';
import 'package:qiyamy/utils/grid_item.dart';

class AlAjzaaTab extends StatelessWidget {
  AlAjzaaTab({super.key});

  Map alAhzab = getAlAhzabMap();

  @override
  Widget build(BuildContext context) {

    final alAjzaa = alAhzab.entries
    .where((entry) => entry.key % 2 != 0)
    .map((entry) => entry.value)
    .toList();

    return GridView.builder(
        padding: EdgeInsets.all(5),
        itemCount: 30,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) =>  GridItem(
            hizbNumber: (index+1).toString(),
            hizbTitle: alAjzaa[index]['short'],
          )
        );
  }
}

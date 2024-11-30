// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:qiyamy/utils/al_ahzab.dart';
import 'package:qiyamy/utils/grid_item.dart';

class AlAjzaaPage extends StatelessWidget {
  AlAjzaaPage({super.key});

  List alAhzab = getAlAhzabList();

  // final filteredList = alAhzab.asMap().entries
  //   .where((entry) => entry.key % 2 != 0)
  //   .map((entry) => entry.value)
  //   .toList();

  @override
  Widget build(BuildContext context) {

    final alAjzaa = alAhzab.asMap().entries
    .where((entry) => entry.key % 2 == 0)
    .map((entry) => entry.value)
    .toList();

    return GridView.builder(
        padding: EdgeInsets.all(5),
        itemCount: 30,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) =>  GridItem(
            hizbNumber: (index + 1).toString(),
            hizbTitle: alAjzaa[index],
          )
        );
  }
}

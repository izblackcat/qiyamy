// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:qiyamy/utils/al_ahzab.dart';
import 'package:qiyamy/utils/grid_item.dart';

class AlAhzabTab extends StatelessWidget {
  AlAhzabTab({super.key});

  Map alAhzab = getAlAhzabMap();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(5),
        itemCount: 60,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => GridItem(
              hizbNumber: alAhzab[index + 1]['number'].toString(),
              hizbTitle: alAhzab[index + 1]['short'],
            ));
  }
}

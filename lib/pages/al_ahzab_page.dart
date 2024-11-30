

// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:qiyamy/utils/al_ahzab.dart';
import 'package:qiyamy/utils/grid_item.dart';

class AlAhzabPage extends StatelessWidget {
  AlAhzabPage({super.key});

   List alAhzab = getAlAhzabList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
          padding: EdgeInsets.all(5),
          itemCount: 60,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) => GridItem(
                hizbNumber: (index + 1).toString(),
                hizbTitle: alAhzab[index],
              )
      );
  }
}
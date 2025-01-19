import 'package:flutter/material.dart';
import 'package:qiyamy/utils/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Align(
        alignment: Alignment.centerRight,
        child: Text(
          "قيامي",
          style:
              TextStyle(fontFamily: 'Rakkas', fontSize: 45, color: mainColor),
        ),
      ),
    );
  }
}

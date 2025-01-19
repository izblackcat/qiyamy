import 'package:flutter/material.dart';
import 'package:qiyamy/utils/colors.dart';

class TextSubtitle extends StatelessWidget {
  final String text;

  const TextSubtitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'ReemKufi', fontSize: 20, color: mainColor),
        ),
      ),
    );
  }
}

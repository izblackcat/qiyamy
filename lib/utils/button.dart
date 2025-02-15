// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:qiyamy/utils/colors.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final void Function()? onPressedFunc;
  final bool ? outlined;

  const Button(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.onPressedFunc, this.outlined});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ElevatedButton(
        onPressed: onPressedFunc,
        child: Text(buttonText,
            style: TextStyle(
                fontFamily: 'ReemKufi', fontSize: 20, color: textColor)),
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(buttonColor),
            fixedSize: WidgetStatePropertyAll(Size(180, 20)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: outlined==true
                        ? BorderSide(color: mainColor)
                        : BorderSide.none))),
      ),
    );
  }
}

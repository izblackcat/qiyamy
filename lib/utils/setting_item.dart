import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qiyamy/utils/colors.dart';

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String name;

  const SettingItem({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: fourthColor, borderRadius: BorderRadius.circular(12)),
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              FaIcon(
                icon,
                color: mainColor,
                size: 25,
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                name,
                style: const TextStyle(
                    fontFamily: 'ReemKufi', fontSize: 20, color: mainColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}

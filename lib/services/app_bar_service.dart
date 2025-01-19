import 'package:flutter/material.dart';
import 'package:qiyamy/utils/colors.dart';

class AppBarService {
  static final AppBarService _instance = AppBarService._internal();
  factory AppBarService() => _instance;
  AppBarService._internal();

  getAppBar() {
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

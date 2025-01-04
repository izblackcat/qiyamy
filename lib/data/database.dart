import 'package:hive_flutter/hive_flutter.dart';

class QiyamiDatabase {
  List alAhzabList = [];

  var alAhzabBox = Hive.box("alAhzabBox");

  void createInitialAhzab() {
    // alAhzabList = [32, 1, 29, 34, 2, 0, 24, 12, 13, 10, 18];
    alAhzabList = [];
  }

  void loadAlAhzab() {
    alAhzabList = alAhzabBox.get("alAhzabList");
  }

  void updateAlAhzab() {
    alAhzabBox.put("alAhzabList", alAhzabList);
  }
}

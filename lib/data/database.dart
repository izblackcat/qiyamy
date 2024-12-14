import 'package:hive_flutter/hive_flutter.dart';

class QiyamiDatabase {
  List alAhzabList = [];

  var alAhzabBox = Hive.box("alAhzabBox");

  void createInitialAhzab() {
    alAhzabList = [];
  }

  void loadAlAhzab() {
    alAhzabList = alAhzabBox.get("alAhzabList");
  }

  void updateAlAhzab() {
    alAhzabBox.put("alAhzabList", alAhzabList);
  }
}

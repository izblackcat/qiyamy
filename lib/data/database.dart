// ignore_for_file: avoid_print

import 'package:hive_flutter/hive_flutter.dart';

class QiyamiDatabase {
  // all hizbs :

  List qiyamAhzabList = [];

  var alAhzabBox = Hive.box("alAhzabBox");
  var memorizedAhzabBox = Hive.box("memorizedAhzab");

  List getAlAhzabList() {
    return qiyamAhzabList;
  }

  void createInitialAhzab() {
    qiyamAhzabList = [];
  }

  List loadAlAhzab() {
    // qiyamAhzabList = alAhzabBox.get("alAhzabList");
    if (alAhzabBox.get("alAhzabList") != null) {
      qiyamAhzabList = alAhzabBox.get("alAhzabList");
    } else {
      qiyamAhzabList = [];
    }
    return qiyamAhzabList;
  }

  void updateAlAhzab() {
    alAhzabBox.put("alAhzabList", qiyamAhzabList);
  }

  // memorized hizbs :

  List memorizedHizbs = [];

  void createInitialMemorizedHizbs() {
    memorizedHizbs = [];
  }

  List loadMemorizedHizbs() {
    if (memorizedAhzabBox.get("memorizedAhzab") != null) {
      memorizedHizbs = memorizedAhzabBox.get("memorizedAhzab");
    } else {
      memorizedHizbs = [];
    }
    return memorizedHizbs;
  }

  void updateMemorizedHizbs(List ahzab) {
    memorizedAhzabBox.put("memorizedAhzab", ahzab);
  }
}

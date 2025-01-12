import 'package:flutter/material.dart';
import 'package:qiyamy/services/settings_service.dart';
import 'package:qiyamy/utils/colors.dart';
import 'package:qiyamy/utils/setting_item.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsService = SettingsService();

    return Scaffold(
        body: ListView(children: [
      const Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Text("الإعدادات",
            style: TextStyle(
                fontFamily: 'Rakkas', fontSize: 27, color: mainColor)),
      ),
      const SizedBox(
        height: 10,
      ),
      for (var setting in settingsService.mainSettings)
        SettingItem(icon: setting['icon'], name: setting['name']),
      const SizedBox(
        height: 10,
      ),
      const Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Text("أخرى",
            style: TextStyle(
                fontFamily: 'Rakkas', fontSize: 27, color: mainColor)),
      ),
      const SizedBox(
        height: 10,
      ),
      for (var setting in settingsService.otherSettings)
        SettingItem(icon: setting['icon'], name: setting['name']),
    ]));
  }
}

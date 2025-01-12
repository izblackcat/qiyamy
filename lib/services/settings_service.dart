import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsService {
  static final SettingsService _instance = SettingsService._internal();
  factory SettingsService() => _instance;
  SettingsService._internal();

  List mainSettings = [
    {'icon': FontAwesomeIcons.solidHandPointer, 'name': 'أحزاب قيام الليل'},
    {
      'icon': FontAwesomeIcons.solidClipboard,
      'name': 'طريقة اختيار حزب القيام'
    },
    {'icon': FontAwesomeIcons.solidMoon, 'name': 'مظهر التطبيق'},
  ];

  List otherSettings = [
    {'icon': FontAwesomeIcons.shareNodes, 'name': 'شارك تطبيق قيامي'},
    {
      'icon': FontAwesomeIcons.solidStar,
      'name': 'قم بتقييمنا على متجر التطبيقات'
    },
    {'icon': FontAwesomeIcons.solidHeart, 'name': 'قم بمتابعتنا'},
  ];
}

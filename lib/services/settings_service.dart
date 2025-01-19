import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsService {
  static final SettingsService _instance = SettingsService._internal();
  factory SettingsService() => _instance;
  SettingsService._internal();

  List mainSettings = [
    {
      'icon': FontAwesomeIcons.solidHandPointer,
      'name': 'أحزاب قيام الليل',
      'route': '/choose_hizbs'
    },
    {
      'icon': FontAwesomeIcons.solidClipboard,
      'name': 'طريقة اختيار حزب القيام',
      'route': '/homepage'
    },
    {
      'icon': FontAwesomeIcons.solidMoon,
      'name': 'مظهر التطبيق',
      'route': '/homepage'
    },
  ];

  List otherSettings = [
    {
      'icon': FontAwesomeIcons.shareNodes,
      'name': 'شارك تطبيق قيامي',
      'route': '/homepage'
    },
    {
      'icon': FontAwesomeIcons.solidStar,
      'name': 'قم بتقييمنا على متجر التطبيقات',
      'route': '/homepage'
    },
    {
      'icon': FontAwesomeIcons.solidHeart,
      'name': 'قم بمتابعتنا',
      'route': '/homepage'
    },
  ];
}

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:qiyamy/utils/colors.dart';
import 'package:intl/intl.dart';

class QiyamService {
  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 8,
        behavior: SnackBarBehavior.floating,
        backgroundColor: secondColor,
        content: Text(
          textAlign: TextAlign.center,
          message,
          style: const TextStyle(
            fontSize: 16.0,
            fontFamily: "ReemKufi",
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  String getDate2() {
    initializeDateFormatting("ar_MO", null);

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMMM y', 'ar_MO').format(now);

    return formattedDate;
  }

  String getDate() {
    initializeDateFormatting("ar_MO", null);

    List<String> moroccanMonths = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'ماي',
      'يونيو',
      'يوليوز',
      'غشت',
      'شتنبر',
      'أكتوبر',
      'نونبر',
      'دجنبر'
    ];

    DateTime now = DateTime.now();
    String dayName = DateFormat('EEEE', 'ar').format(now);
    String formattedDate =
        "$dayName ${now.day} ${moroccanMonths[now.month - 1]} ${now.year}";
    return formattedDate;
  }
}

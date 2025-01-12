import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:qiyamy/utils/al_ahzab.dart';
import 'package:qiyamy/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:qiyamy/utils/shimmer_box.dart';
import 'package:shimmer/shimmer.dart';

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
            fontSize: 18.0,
            fontFamily: "Rakkas",
          ),
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  String todayDate() {
    initializeDateFormatting("ar_SA", null);

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

  Widget buildShimmerPlaceholder() {
    return Shimmer.fromColors(
        baseColor: thirdColor,
        highlightColor: Colors.white,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShimmerBox(height: 10, width: 200, color: Colors.white),
            SizedBox(
              height: 10,
            ),
            ShimmerBox(height: 10, width: 280, color: Colors.white),
            SizedBox(
              height: 10,
            ),
            ShimmerBox(height: 10, width: 250, color: Colors.white),
            SizedBox(
              height: 10,
            ),
            ShimmerBox(height: 10, width: 200, color: Colors.white),
            SizedBox(
              height: 10,
            ),
            ShimmerBox(height: 10, width: 100, color: Colors.white),
            SizedBox(
              height: 10,
            ),
            ShimmerBox(height: 10, width: 280, color: Colors.white),
            SizedBox(
              height: 10,
            ),
            ShimmerBox(height: 10, width: 100, color: Colors.white),
            SizedBox(
              height: 10,
            ),
            ShimmerBox(height: 10, width: 200, color: Colors.white),
          ],
        ));
  }

  Widget buildQiyamColumn(int hizbNumber) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text((hizbNumber + 1).toString(),
              style: const TextStyle(
                  fontFamily: 'Rakkas', fontSize: 32, color: mainColor)),
        ),
        const Spacer(),
        Flexible(
          flex: 6,
          fit: FlexFit.loose,
          child: Text(hizbsMap[hizbNumber + 1]['long'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'ReemKufi', fontSize: 20, color: mainColor)),
        ),
        const Spacer(),
        Expanded(
          flex: 1,
          child: Text("سورة ${hizbsMap[hizbNumber + 1]['surat']}",
              style: const TextStyle(
                  fontFamily: 'Rakkas', fontSize: 18, color: mainColor)),
        ),
      ],
    );
  }
}

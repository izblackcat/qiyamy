import 'package:flutter/material.dart';
import 'package:qiyamy/utils/colors.dart';

class FinishGreeting extends StatelessWidget {
  const FinishGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: fourthColor,
      titlePadding: EdgeInsets.zero,
      title: Align(
        alignment: Alignment.centerRight,
        child:  TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const CircleAvatar(
              radius: 18,
              backgroundColor: secondColor,
              child: Icon(Icons.close, color: Colors.white, size: 16)),
        ),
      ),
      content: Container(
        height: 290,
        width: 250,
        decoration: BoxDecoration(
            color: fourthColor, borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(25),
        child: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "أَحْسَنْتَ",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Rakkas',
                  color: mainColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6,),
            Text(
              "تَقَبَّلَ اَللهُ مِنْكُمْ",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Rakkas',
                  color: mainColor,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: secondColor,
                  size: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: Icon(
                    Icons.star,
                    color: secondColor,
                    size: 80,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: secondColor,
                  size: 60,
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "إِلَى اَلْغَدِ إِنْ شَاءَ اَللَهُ",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Rakkas',
                  color: mainColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )),
      ),
    );

    // return Stack(
    //   children: [
    //     AlertDialog(
    //       title: Text("Alert Title"),
    //       content: Text("This is the content of the AlertDialog."),
    //       actions: [
    //         TextButton(
    //           onPressed: () => Navigator.of(context).pop(),
    //           child: Text("OK"),
    //         ),
    //       ],
    //     ),
    //     Positioned(
    //       right: 48,
    //       top: 235,
    //       child: GestureDetector(
    //         onTap: () => Navigator.of(context).pop(),
    //         child: CircleAvatar(
    //           radius: 20,
    //           backgroundColor: Colors.red,
    //           child: Icon(Icons.close, color: Colors.white, size: 16),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
